# $NetBSD: Makefile,v 1.39 2023/11/25 14:05:09 gdt Exp $

DISTNAME=	pcsc-lite-2.0.1
CATEGORIES=	security
MASTER_SITES=	https://pcsclite.apdu.fr/files/
EXTRACT_SUFX=	.tar.bz2

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://pcsclite.apdu.fr/
COMMENT=	Middleware to access a smart card using SCard API (PC/SC)
LICENSE=	modified-bsd

USE_LANGUAGES=	c c++
USE_LIBTOOL=	yes
USE_TOOLS+=	pkg-config gmake flex
GNU_CONFIGURE=	yes

.include "../../mk/bsd.prefs.mk"

CONFIGURE_ARGS+=	--sharedstatedir=${VARBASE}
CONFIGURE_ARGS+=	--sysconfdir=${PKG_SYSCONFDIR}
CONFIGURE_ARGS+=	--enable-confdir=${PKG_SYSCONFDIR}/reader.conf.d
CONFIGURE_ARGS+=	--enable-ipcdir=${VARBASE}/pcsc-lite
CONFIGURE_ARGS+=	--enable-usbdropdir=${PREFIX}/lib/pcsc-lite/drivers
CONFIGURE_ARGS+=	--disable-libudev
CONFIGURE_ARGS+=	--disable-libsystemd
MAKE_DIRS+=		${VARBASE}/pcsc-lite
MAKE_DIRS+=		${PREFIX}/lib/pcsc-lite
MAKE_DIRS+=		${PREFIX}/lib/pcsc-lite/drivers
MAKE_DIRS+=		${PKG_SYSCONFDIR}/reader.conf.d

EGDIR=			${PREFIX}/share/examples/pcsc-lite

PKGCONFIG_OVERRIDE+=	src/libpcsclite.pc.in

BUILD_DEFS+=		VARBASE
RCD_SCRIPTS=		pcscd

.include "../../devel/libusb1/buildlink3.mk"
.include "../../security/polkit/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
