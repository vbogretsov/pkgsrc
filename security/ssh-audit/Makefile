# $NetBSD: Makefile,v 1.5 2023/10/19 12:58:34 wiz Exp $

DISTNAME=	ssh-audit-3.0.0
CATEGORIES=	security
MASTER_SITES=	${MASTER_SITE_GITHUB:=jtesta/}
GITHUB_RELEASE=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/jtesta/ssh-audit/
COMMENT=	Tool for SSH server & client configuration auditing
LICENSE=	mit

TEST_DEPENDS+=	${PYPKGPREFIX}-test-[0-9]*:../../devel/py-test

USE_LANGUAGES=	# none

INSTALLATION_DIRS+=	${PKGMANDIR}/man1

post-install:
	${RUN}${INSTALL_MAN} ${WRKSRC}/ssh-audit.1 \
		${DESTDIR}${PREFIX}/${PKGMANDIR}/man1

TEST_ENV+=	PYTHONPATH=${WRKSRC}/build/lib
do-test:
	cd ${WRKSRC} && ${SETENV} ${TEST_ENV} pytest-${PYVERSSUFFIX}

.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
