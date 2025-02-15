# $NetBSD: Makefile,v 1.64 2023/11/16 09:22:51 wiz Exp $

.include "version.mk"

DISTNAME=	gstreamer-${GST_VERSION}
PKGNAME=	${DISTNAME:S/gstreamer/gstreamer1/}
CATEGORIES=	multimedia
MASTER_SITES=	https://gstreamer.freedesktop.org/src/gstreamer/
EXTRACT_SUFX=	.tar.xz

COMMENT=	Open source multimedia framework

USE_TOOLS+=	bison flex perl pkg-config xgettext
TEST_TARGET=	check
FLEX_REQD=	2.5.31

PYTHON_VERSIONS_INCOMPATIBLE=	27

LDFLAGS.SunOS+=		-lsocket -lnsl -lrt

PKGCONFIG_OVERRIDE+=	pkgconfig/gstreamer-controller.pc.in
PKGCONFIG_OVERRIDE+=	pkgconfig/gstreamer-check.pc.in
PKGCONFIG_OVERRIDE+=	pkgconfig/gstreamer-net.pc.in
PKGCONFIG_OVERRIDE+=	pkgconfig/gstreamer.pc.in
PKGCONFIG_OVERRIDE+=	pkgconfig/gstreamer-base.pc.in

CHECK_PORTABILITY_SKIP+=	hooks/pre-commit.hook

REPLACE_PYTHON+=	gst/parse/get_flex_version.py
REPLACE_PYTHON+=	docs/gst-plugins-doc-cache-generator.py
REPLACE_PYTHON+=	gst/parse/gen_grammar.py.in
REPLACE_PYTHON+=	gst/parse/gen_lex.py.in
REPLACE_PYTHON+=	scripts/dist-translations.py
REPLACE_PYTHON+=	scripts/extract-release-date-from-doap-file.py

# for tests
MAKE_ENV+=		LD_LIBRARY_PATH=${WRKSRC}/output/gst:${WRKSRC}/output/libs/gst/check:${WRKSRC}/output/libs/gst/base:${WRKSRC}/output/libs/gst/controller:${WRKSRC}/output/libs/gst/net:${WRKSRC}/output/plugins/elements:${WRKSRC}/output/plugins/tracers

# test status as of 1.18.5
#Ok:                 66
#Expected Fail:      0
#Fail:               39
#Unexpected Pass:    0
#Skipped:            1
#Timeout:            0

.include "../../lang/python/application.mk"
.include "../../devel/meson/build.mk"
# test framework, only needed at test time
BUILDLINK_DEPMETHOD.check=	build
.include "../../devel/check/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
BUILDLINK_DEPMETHOD.gobject-introspection=	build
.include "../../devel/gobject-introspection/buildlink3.mk"
.include "../../devel/gmp/buildlink3.mk"
.include "../../math/gsl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
