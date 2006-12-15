# $NetBSD: bsd.install-vars.mk,v 1.5 2006/12/15 20:54:47 joerg Exp $
#
# This Makefile fragment is included separately by bsd.pkg.mk and
# defines some variables which must be defined earlier than where
# bsd.install.mk is included.
#
# Package-settable variables:
#
# INSTALLATION_DIRS_FROM_PLIST
#	If set to "yes", the static PLIST files of the package will
#	be used to determine which directories need to be created before
#	the "real" installation should start.
#

# If a package sets PKG_DESTDIR_SUPPORT to a non-empty value,
# it is supposed to deal with missing directories already.
#
.if !empty(PKG_DESTDIR_SUPPORT)
NO_MTREE=	yes
.endif

# If a package sets INSTALLATION_DIRS, then it's known to pre-create
# all of the directories that it needs at install-time, so we don't need
# mtree to do it for us.
#
.if defined(INSTALLATION_DIRS) && !empty(INSTALLATION_DIRS)
NO_MTREE=	yes
.endif

INSTALLATION_DIRS_FROM_PLIST?=	no
.if !empty(INSTALLATION_DIRS_FROM_PLIST:M[Yy][Ee][Ss])
NO_MTREE=	yes
.endif

#
# Certain classes of packages never need to run mtree during installation
# because they manage the creation of their own directories.
#
.if (${PKG_INSTALLATION_TYPE} == "pkgviews") && defined(CROSSBASE)
NO_MTREE=	yes
.endif

USE_TOOLS+=	${NO_MTREE:D:Umtree\:bootstrap}

# If MANZ is defined, then we want the final man pages to be compressed.
# If MANZ is not defined, then we want the final man pages to be
# uncompressed.
#
# We need to figure out if during installation, we need either gunzip
# or gzip to decompress or compress the installed man pages.  If a
# package sets MANCOMPRESSED to "yes" or "no", then it's an indication
# to the install code that the package itself installed the man pages
# either compressed or uncompressed.  If a package sets
# MANCOMPRESSED_IF_MANZ, then the package uses BSD-style makefiles,
# so we need to determine if the BSD-style makefile causes the man
# pages to be compressed or not.
#
.if !defined(_MANCOMPRESSED)
.  if defined(MANCOMPRESSED) && !empty(MANCOMPRESSED:M[yY][eE][sS])
_MANCOMPRESSED=		yes
.  else
_MANCOMPRESSED=		no
.  endif
.  if defined(MANCOMPRESSED_IF_MANZ) && defined(PKGMAKECONF)
_MANCOMPRESSED!=							\
	{ ${ECHO} ".include \""${PKGMAKECONF:Q}"\"";			\
	  ${ECHO} "all:";						\
	  ${ECHO} ".if defined(MANZ)";					\
	  ${ECHO} "	@${ECHO} yes";					\
	  ${ECHO} ".else";						\
	  ${ECHO} "	@${ECHO} no";					\
	  ${ECHO} ".endif";						\
	} | ${MAKE} -f - all
.  endif
.endif
_MANZ=		${MANZ:Dyes:Uno}
MAKEVARS+=	_MANCOMPRESSED _MANZ

.if !empty(_MANCOMPRESSED:M[yY][eE][sS]) && empty(_MANZ:M[yY][eE][sS])
USE_TOOLS+=	gunzip
.endif
.if empty(_MANCOMPRESSED:M[yY][eE][sS]) && !empty(_MANZ:M[yY][eE][sS])
USE_TOOLS+=	gzip
.endif
