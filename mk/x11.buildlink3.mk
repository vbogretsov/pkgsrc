# $NetBSD: x11.buildlink3.mk,v 1.8 2007/08/17 20:27:30 joerg Exp $
#
# This Makefile fragment is meant to be included by packages that
# require an X11 distribution.  x11.buildlink3.mk will include the
# buildlink3.mk file from the appropriate X11 distribution.
#

X11_BUILDLINK3_MK:=	${X11_BUILDLINK3_MK}+

.if !defined(_X11_BUILDLINK3_MK)
_X11_BUILDLINK3_MK=	1

USE_X11=	yes

.  include "../../mk/bsd.prefs.mk"

#
# Sanity checks.
#

.  if ${X11_TYPE} != "native" 
_WRONG_X11_TYPE:=	${X11_TYPE}
PKG_FAIL_REASON+=	"Do not include x11.version.mk for X11_TYPE != \"native\"."
X11_TYPE:=		native
X11BASE:=		/usr
.  endif

.  include "../../mk/x11.version.mk"

.  if defined(GNU_CONFIGURE)
CONFIGURE_ARGS+=	--x-includes=${X11BASE:Q}/include
CONFIGURE_ARGS+=	--x-libraries=${X11BASE:Q}/lib${LIBABISUFFIX:Q}
.  endif

X11_LDFLAGS+=	${COMPILER_RPATH_FLAG}${X11BASE}/lib${LIBABISUFFIX}
X11_LDFLAGS+=	-L${X11BASE}/lib${LIBABISUFFIX}
.endif	# _X11_BUILDLINK3_MK

.include "${X11_PKGSRCDIR.${X11_TYPE}}/buildlink3.mk"

X11_BUILDLINK3_MK:=	${X11_BUILDLINK3_MK:S/+$//}
