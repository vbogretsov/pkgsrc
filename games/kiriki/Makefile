# $NetBSD: Makefile,v 1.66 2023/11/12 13:21:36 wiz Exp $

DISTNAME=	kiriki-${KAPPSVER}
PKGREVISION=	3
CATEGORIES=	games

HOMEPAGE=	https://kde.org/applications/games/kiriki/
COMMENT=	Addictive and fun dice game for KDE
LICENSE=	gnu-gpl-v2 AND gnu-fdl-v1.2

.include "../../meta-pkgs/kde/applications.mk"

TOOL_DEPENDS+=	kdoctools>=5.19.0:../../devel/kdoctools

USE_TOOLS+=	msgmerge

.include "../../games/libkdegames/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
