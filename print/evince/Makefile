# $NetBSD: Makefile,v 1.168 2023/11/15 09:25:53 wiz Exp $

DISTNAME=	evince-43.0
PKGREVISION=	11
CATEGORIES=	print gnome
MASTER_SITES=	${MASTER_SITE_GNOME:=sources/evince/${PKGVERSION_NOREV:R}/}
EXTRACT_SUFX=	.tar.xz

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://wiki.gnome.org/Apps/Evince
COMMENT=	Document viewer for multiple document formats
LICENSE=	gnu-gpl-v2

USE_PKGLOCALEDIR=	yes
USE_TOOLS=		itstool msgfmt pkg-config

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../mk/bsd.prefs.mk"

# msgfmt: unknown option -- xml
.if ${OPSYS} == "NetBSD"
TOOLS_PLATFORM.msgfmt=
.endif

.include "options.mk"

MESON_ARGS+=	-Dcomics=disabled
MESON_ARGS+=	-Dgspell=disabled
MESON_ARGS+=	-Dintrospection=true
MESON_ARGS+=	-Dlocaledir=${PKGLOCALEDIR}/locale
MESON_ARGS+=	-Dnautilus=false
MESON_ARGS+=	-Dthumbnail_cache=disabled

BUILDLINK_API_DEPENDS.glib2+=	glib2>=2.44.0
.include "../../devel/glib2/schemas.mk"
.include "../../devel/gobject-introspection/buildlink3.mk"
BUILDLINK_API_DEPENDS.libhandy+=	libhandy>=1.5.0
.include "../../devel/libhandy/buildlink3.mk"
.include "../../devel/py-gi-docgen/buildlink3.mk"
.include "../../graphics/adwaita-icon-theme/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../print/poppler-glib/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/libxml2/buildlink3.mk"
BUILDLINK_API_DEPENDS.gtk3+=	gtk3+>=3.22.0
.include "../../x11/gtk3/buildlink3.mk"

.include "../../devel/meson/build.mk"
.include "../../mk/bsd.pkg.mk"
