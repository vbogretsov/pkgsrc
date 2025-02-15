# $NetBSD: Makefile,v 1.101 2023/11/14 14:02:23 wiz Exp $

DISTNAME=		racket-8.10-src
PKGNAME=		${DISTNAME:S/-src$//}
PKGREVISION=		7
CATEGORIES=		lang
MASTER_SITES_PLT=	https://download.racket-lang.org/installers/${PKGVERSION_NOREV}/
MASTER_SITES_PLT+=	https://mirror.racket-lang.org/installers/${PKGVERSION_NOREV}/
MASTER_SITES_PLT+=	https://plt.eecs.northwestern.edu/racket-mirror/${PKGVERSION_NOREV}/
MASTER_SITES_PLT+=	https://www.cs.utah.edu/plt/installers/${PKGVERSION_NOREV}/
MASTER_SITES_PLT+=	http://mirror.informatik.uni-tuebingen.de/mirror/racket/${PKGVERSION_NOREV}/
MASTER_SITES_PLT+=	http://mirror.csclub.uwaterloo.ca/racket/racket-installers/${PKGVERSION_NOREV}/
MASTER_SITES_PLT+=	https://racket.infogroep.be/${PKGVERSION_NOREV}/
# Pre-release:
#MASTER_SITES_PLT=	http://pre-release.racket-lang.org/installers/
MASTER_SITES=		${MASTER_SITES_PLT}
EXTRACT_SUFX=		.tgz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://racket-lang.org/
COMMENT=	Scheme-based dialect of Lisp
LICENSE=	gnu-lgpl-v2

CONFLICTS+=	drscheme-[0-9]* mzscheme-[0-9]* racket-textual-[0-9]*

# Spins until killed.
NOT_FOR_BULK_PLATFORM+=	SunOS-*-*

WRKSRC=		${WRKDIR}/${PKGNAME_NOREV}

GNU_CONFIGURE=		yes
CONFIGURE_DIRS=		src
CONFIGURE_ARGS=		--enable-pthread
CONFIGURE_ARGS+=	--enable-curses
CONFIGURE_ARGS+=	--enable-iconv

USE_LANGUAGES=		c c++
USE_TOOLS+=		gmake pkg-config
USE_TOOLS.NetBSD+=	paxctl
UNLIMIT_RESOURCES=	virtualsize datasize cputime
CONFIGURE_ENV.NetBSD+=	PAXCTL=${TOOLS_PLATFORM.paxctl:Q}
PLIST_SUBST+=		PREFIX=${PREFIX:Q}

CPPFLAGS.SunOS+=	-D_POSIX_PTHREAD_SEMANTICS
LDFLAGS.DragonFly+=	-rdynamic

CHECK_RELRO_SKIP=	bin/mred bin/mzscheme
CHECK_PORTABILITY_SKIP=	src/ChezScheme/rpm/Makefile

.for f in use-c-printf.rkt use-crypt.rkt use-esd.rkt use-magick.rkt use-sndfile.rkt use-tcl.rkt use-xmmsctrl.rkt use-xosd.rkt
REPLACE_RACKET+=	share/pkgs/racket-doc/ffi/examples/${f}
.endfor

REPLACE_INTERPRETER+=	racket
REPLACE.racket.old=	.*racket
REPLACE.racket.new=	${PREFIX}/bin/racket
REPLACE_FILES.racket=	${REPLACE_RACKET}

EGDIR=			share/examples/racket
INSTALLATION_DIRS+=	${EGDIR}
OWN_DIRS+=		${PKG_SYSCONFDIR}/racket
CONF_FILES+=		${EGDIR}/config.rktd \
			${PKG_SYSCONFDIR}/racket/config.rktd

post-install:
	${MV} -f ${DESTDIR:Q}${PKG_SYSCONFDIR:Q}/racket/config.rktd \
		${DESTDIR:Q}${PREFIX:Q}/${EGDIR:Q}

.include "../../converters/libiconv/buildlink3.mk"
.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/libffi/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../graphics/cairo/buildlink3.mk"
.include "../../graphics/png/buildlink3.mk"
.include "../../mk/jpeg.buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../x11/libXaw/buildlink3.mk"
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"

PTHREAD_AUTO_VARS=	yes
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/terminfo.buildlink3.mk"
.include "../../mk/curses.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
