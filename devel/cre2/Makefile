# $NetBSD: Makefile,v 1.9 2023/06/06 10:51:58 wiz Exp $

DISTNAME=	cre2-0.3.6
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	${MASTER_SITE_GITHUB:=marcomaggi/}
GITHUB_TAG=	v${PKGVERSION_NOREV}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://github.com/marcomaggi/cre2
COMMENT=	C wrapper for re2 regular expression library
LICENSE=	modified-bsd

USE_LANGUAGES+=		c c++
USE_LIBTOOL=		yes
USE_TOOLS+=		autoconf autoreconf automake gmake makeinfo pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-maintainer-mode
TEST_TARGET=		check

INFO_FILES=	yes

pre-configure:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} sh ./autogen.sh

.include "../../devel/re2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
