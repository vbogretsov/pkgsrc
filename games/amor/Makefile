# $NetBSD: Makefile,v 1.64 2023/11/12 13:21:28 wiz Exp $

DISTNAME=	amor-15.08.3
PKGREVISION=	37
CATEGORIES=	games
COMMENT=	KDE creature for your desktop
MASTER_SITES=	${MASTER_SITE_KDE:=applications/15.08.3/src/}

.include "../../meta-pkgs/kde4/Makefile.kde4"

.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/kdelibs4/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
