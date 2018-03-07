# $NetBSD: build.mk,v 1.3 2018/03/07 11:57:29 wiz Exp $

BUILD_DEPENDS+=	${PYPKGPREFIX}-meson-[0-9]*:../../devel/py-meson

.PHONY: meson-configure meson-build meson-install

do-configure: meson-configure
meson-configure:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} meson --prefix ${PREFIX} --buildtype=plain ${MESON_ARGS} . output

do-build: meson-build
meson-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ninja -C output

do-install: meson-install
meson-install:
	cd ${WRKSRC} && ${SETENV} ${INSTALL_ENV} ninja -C output install

PYTHON_VERSIONS_INCOMPATIBLE=	27

.include "../../lang/python/application.mk"
