# $NetBSD: Makefile,v 1.21 2022/06/28 11:35:55 wiz Exp $
#

DISTNAME=		cpogm-1.0
PKGREVISION=		10
CATEGORIES=		sysutils
MASTER_SITES=		http://software.kimmo.suominen.com/

MAINTAINER=		pkgsrc-users@NetBSD.org
COMMENT=		Copy owner, group and mode of a file

USE_TOOLS+=		perl:run

NO_CONFIGURE=		yes
BUILD_TARGET=		all PREFIX=${PREFIX}
INSTALL_MAKE_FLAGS+=	PREFIX=${PREFIX}
INSTALLATION_DIRS=	sbin ${PKGMANDIR}/man8

.include "../../mk/bsd.pkg.mk"
