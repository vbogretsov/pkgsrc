# $NetBSD: Makefile,v 1.90 2023/11/14 14:01:33 wiz Exp $

DISTNAME=	pgadmin3-1.22.2
PKGREVISION=	24
CATEGORIES=	databases
MASTER_SITES=	${MASTER_SITE_PGSQL:=pgadmin/pgadmin3/v${PKGVERSION_NOREV}/src/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://www.pgadmin.org/
COMMENT=	Graphical PostgreSQL client and administration tool
LICENSE=	postgresql-license

USE_LANGUAGES=		c99 c++11
USE_TOOLS+=		echo gmake sed
GNU_CONFIGURE=		yes

PGSQL_VERSIONS_ACCEPTED=	13 12 11

GNU_CONFIGURE_WX_CONFIG=	no

REPLACE_SH=		pgadmin/ver_svn.sh

.include "options.mk"

CONFIGURE_ARGS+=	--enable-databasedesigner
CONFIGURE_ARGS+=	--with-libssl-prefix=${BUILDLINK_PREFIX.openssl}
CONFIGURE_ARGS+=	--with-libxml2=${BUILDLINK_PREFIX.libxml2}
CONFIGURE_ARGS+=	--with-libxslt=${BUILDLINK_PREFIX.libxslt}
CONFIGURE_ARGS+=	--with-libz
CONFIGURE_ARGS+=	--with-libz-prefix=${BUILDLINK_PREFIX.zlib}
CONFIGURE_ARGS+=	--with-openssl

.include "../../mk/bsd.prefs.mk"

.if ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--with-arch-${MACHINE_ARCH}
.endif

.include "../../devel/zlib/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../security/libssh2/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/libxslt/buildlink3.mk"
.include "../../x11/wxGTK30/buildlink3.mk"
.include "../../mk/pgsql.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
