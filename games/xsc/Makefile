# $NetBSD: Makefile,v 1.14 2023/08/02 19:21:53 nia Exp $
#

DISTNAME=		xsc-1.5
PKGREVISION=		2
CATEGORIES=		games
MASTER_SITES=		http://www.panix.com/~mbh/xsc/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		https://www.panix.com/~mbh/xsc/
COMMENT=		Star Castle clone

GNU_CONFIGURE=		yes
USE_LANGUAGES=		c c++
INSTALLATION_DIRS=	bin

# Fails with C++14 default language
FORCE_CXX_STD=		c++03

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/xsc ${DESTDIR}${PREFIX}/bin/xsc
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/share/doc/xsc
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${PREFIX}/share/doc/xsc

BUILDLINK_DEPMETHOD.libXt?=	build

.include "../../x11/libXt/buildlink3.mk"
.include "../../x11/libXt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
