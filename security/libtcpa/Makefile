# $NetBSD: Makefile,v 1.22 2023/10/24 22:10:51 wiz Exp $
#

DISTNAME=		tpm-1.1b
PKGNAME=		${DISTNAME:S/tpm/libtcpa/}
PKGREVISION=		9
CATEGORIES=		security
MASTER_SITES=		${HOMEPAGE}
DISTFILES=		${DISTNAME}${EXTRACT_SUFX} tcpa_man_20031210.tgz

MAINTAINER=		schmonz@NetBSD.org
HOMEPAGE=		https://web.archive.org/web/20090129204118/http://www.research.ibm.com/gsal/tcpa/
COMMENT=		TCPA libraries and test programs from IBM
LICENSE=		modified-bsd

WRKSRC=			${WRKDIR}/TPM

SITES.tcpa_man_20031210.tgz=	http://www.citi.umich.edu/u/rwash/projects/trusted/

BUILD_DIRS=		libtcpa examples
INSTALLATION_DIRS=	bin lib ${PKGMANDIR}/man3 share/doc/${PKGBASE}

do-install:
	${INSTALL_DATA} ${WRKSRC}/libtcpa/libtcpa.a ${DESTDIR}${PREFIX}/lib
	for f in tcpa_demo takeown createkey loadkey evictkey signfile	\
		verifyfile sealfile unsealfile; do			\
		${INSTALL_PROGRAM} ${WRKSRC}/examples/$${f} ${DESTDIR}${PREFIX}/bin; \
	done
	for f in ${WRKDIR}/tcpa_man/*.3; do			\
		${INSTALL_MAN} $${f} ${DESTDIR}${PREFIX}/${PKGMANDIR}/man3;	\
	done
	${INSTALL_DATA} ${WRKSRC}/libtcpa/License ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}
	${INSTALL_DATA} ${WRKSRC}/README ${DESTDIR}${PREFIX}/share/doc/${PKGBASE}

.include "../../security/openssl/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
