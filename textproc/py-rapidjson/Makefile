# $NetBSD: Makefile,v 1.14 2023/10/29 16:43:15 adam Exp $

DISTNAME=	python-rapidjson-1.13
PKGNAME=	${PYPKGPREFIX}-${DISTNAME:S/^python-//}
CATEGORIES=	textproc python
MASTER_SITES=	${MASTER_SITE_PYPI:=p/python-rapidjson/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/python-rapidjson/python-rapidjson
COMMENT=	Python wrapper around rapidjson
LICENSE=	mit

TEST_DEPENDS+=	${PYPKGPREFIX}-test-runner-[0-9]*:../../devel/py-test-runner

USE_LANGUAGES=	c c++11

PYTHON_VERSIONS_INCOMPATIBLE=	27

do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} pytest-${PYVERSSUFFIX} tests

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
