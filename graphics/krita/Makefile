# $NetBSD: Makefile,v 1.119 2023/11/15 20:00:39 wiz Exp $

DISTNAME=		krita-4.4.8
PKGREVISION=		37
CATEGORIES=		graphics kde
MASTER_SITES=		${MASTER_SITE_KDE:=krita/${PKGVERSION_NOREV}/}

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.krita.org/
COMMENT=		Raster graphics editor for digital painting
LICENSE=		gnu-gpl-v2 AND gnu-lgpl-v2.1

#TOOL_DEPENDS+=	automoc4>=0.9.87:../../devel/automoc4

USE_TOOLS+=		msgfmt pkg-config perl
# Uses targets with spaces in the names
USE_TOOLS+=		gmake
USE_LANGUAGES=		c c++
USE_CMAKE=		yes
CMAKE_ARG_PATH=		..
CONFIGURE_DIRS=		_KDE_build
CMAKE_ARGS+=		-DCMAKE_INSTALL_PREFIX=${PREFIX}
CMAKE_ARGS+=		-DCMAKE_DISABLE_FIND_PACKAGE_PyQt5:BOOL=true

pre-configure:
	${MKDIR} ${WRKSRC}/_KDE_build

DEPENDS+=	extra-cmake-modules-[0-9]*:../../devel/extra-cmake-modules
DEPENDS+=	kitemmodels-[0-9]*:../../devel/kitemmodels

# librpcsvc.so deprecation warnings
BUILDLINK_TRANSFORM.NetBSD+=	rm:-Wl,--fatal-warnings

#BUILDLINK_TRANSFORM+=		rm:-Werror=implicit-function-declaration

CONF_FILES+=	${PREFIX}/share/examples/kde-xdg/kritarc \
		${PKG_SYSCONFDIR}/xdg/kritarc

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/application.mk"
.include "../../archivers/quazip/buildlink3.mk"
.include "../../devel/libexecinfo/buildlink3.mk"
.include "../../graphics/exiv2/buildlink3.mk"
.include "../../graphics/openexr/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/giflib/buildlink3.mk"
.include "../../graphics/lcms2/buildlink3.mk"
.include "../../graphics/openjpeg/buildlink3.mk"
.include "../../graphics/opencolorio/buildlink3.mk"
.include "../../graphics/tiff/buildlink3.mk"
.include "../../math/eigen3/buildlink3.mk"
.include "../../archivers/karchive/buildlink3.mk"
BUILDLINK_API_DEPENDS.boost-header+=	boost-headers>=1.73.0nb1
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/libatomic/buildlink3.mk"
.include "../../devel/ki18n/buildlink3.mk"
.include "../../devel/kio/buildlink3.mk"
.include "../../devel/kconfig/buildlink3.mk"
.include "../../devel/kcoreaddons/buildlink3.mk"
.include "../../devel/kcrash/buildlink3.mk"
.include "../../textproc/kcompletion/buildlink3.mk"
.include "../../x11/kitemviews/buildlink3.mk"
.include "../../x11/kguiaddons/buildlink3.mk"
.include "../../x11/kwidgetsaddons/buildlink3.mk"
.include "../../x11/kwindowsystem/buildlink3.mk"
.include "../../math/gsl/buildlink3.mk"
.include "../../graphics/libraw/buildlink3.mk"
.include "../../graphics/libheif/buildlink3.mk"
.include "../../print/poppler-qt5/buildlink3.mk"
.include "../../math/fftw/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.include "../../x11/qt5-qtdeclarative/buildlink3.mk"
.include "../../x11/qt5-qtmultimedia/buildlink3.mk"
.include "../../x11/qt5-qtsvg/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
