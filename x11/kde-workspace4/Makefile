# $NetBSD: Makefile,v 1.114 2023/11/12 13:24:10 wiz Exp $

DISTNAME=	kde-workspace-4.11.22
PKGNAME=	${DISTNAME:S/-4/4-4/}
PKGREVISION=	55
CATEGORIES=	x11
COMMENT=	Base workspace for the KDE 4 integrated X11 desktop
MASTER_SITES=	${MASTER_SITE_KDE:=applications/15.08.0/src/}

.include "../../meta-pkgs/kde4/Makefile.kde4"

DISTFILES=			${DEFAULT_DISTFILES} Daemon.png Daemon.README
DISTFILES+=			NetBSD-flag-1.0.png
SITES.Daemon.png=		${MASTER_SITE_LOCAL}
SITES.Daemon.README=		${MASTER_SITE_LOCAL}
SITES.NetBSD-flag-1.0.png=	${MASTER_SITE_LOCAL}

EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

CMAKE_ARGS+=	-DKDE4_BUILD_TESTS:BOOL=OFF
CMAKE_ARGS+=	-DWITH_NepomukCore:BOOL=OFF
CMAKE_ARGS+=	-DWITH_Soprano:BOOL=OFF
CMAKE_ARGS+=	-DWITH_Wayland:BOOL=OFF
CMAKE_ARGS+=	-DWITH_libgps:BOOL=OFF

# BUILD_MAKE_FLAGS+= VERBOSE=1

USE_TOOLS+=		mkfontdir bdftopcf gmake

FONTS_DIRS.x11+=	${PREFIX}/share/kde/fonts/override
REQD_DIRS+=		${PREFIX}/share/kde/fonts
REQD_DIRS+=		${PREFIX}/share/kde/fonts/override

RCD_SCRIPTS=		kdm

CONF_FILES=		${PREFIX}/share/kde/config/kdm/kdmrc \
			${PKG_SYSCONFDIR}/kdm/kdmrc
OWN_DIRS=		${PKG_SYSCONFDIR}/kdm

CONF_FILES+=		${PREFIX}/share/examples/kde-workspace4/ksysguarddrc \
			${PKG_SYSCONFDIR}/ksysguarddrc
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.ksysguard.processlisthelper.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.ksysguard.processlisthelper.conf
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.fontinst.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.fontinst.conf
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.kcontrol.kcmclock.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.kcontrol.kcmclock.conf
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.kcontrol.kcmkdm.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.kcontrol.kcmkdm.conf

SPECIAL_PERMS+=		${PREFIX}/lib/kde4/libexec/kcheckpass \
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 6555

KDM_USER?=		kdm
KDM_GROUP?=		${KDM_USER}
PKG_USERS_VARS+=	KDM_USER
PKG_GROUPS_VARS+=	KDM_GROUP
PKG_GROUPS=		${KDM_GROUP}
PKG_USERS=		${KDM_USER}:${KDM_GROUP}
PKG_GECOS.${KDM_USER}=	kdm unprivileged user

REPLACE_PERL+=		\
	kcontrol/keys/convertShortcuts.pl \
	kwin/clients/oxygen/data/update_oxygen.pl \
	kwin/data/kwin3_plugin.pl \
	kwin/data/pluginlibFix.pl
REPLACE_SH+=		libs/plasmagenericshell/widgetsexplorer/package/Messages.sh

PY_PATCHPLIST=	yes

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

PLIST_VARS+=		gles utempter noutempter
.if ${OPSYS} == "Linux" && exists(/usr/include/utempter.h)
PLIST.utempter=		yes
.elif ${OPSYS} == "FreeBSD" && exists(/usr/include/utempter.h)
PLIST.utempter=		yes
.elif ${OPSYS} == "SunOS" && exists(/usr/include/utempter.h)
PLIST.utempter=		yes
.else
PLIST.noutempter=	yes
.endif

.if ${OPSYS} == "Linux"
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.powerdevil.backlighthelper.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.powerdevil.backlighthelper.conf
.endif

SUBST_CLASSES+=		paths
SUBST_FILES.paths=	kdm/kcm/main.cpp
SUBST_VARS.paths=	PKG_SYSCONFDIR
SUBST_STAGE.paths=	pre-configure

SUBST_CLASSES+=		qtpath
SUBST_FILES.qtpath=	startkde.cmake
SUBST_VARS.qtpath=	QTDIR
SUBST_STAGE.qtpath=	pre-configure

SUBST_CLASSES+=		isocodes
SUBST_FILES.isocodes=	kcontrol/keyboard/iso_codes.h
SUBST_SED.isocodes=	-e 's,/usr/share/xml/iso-codes,${BUILDLINK_PREFIX.iso-codes}/share/xml/iso-codes,g'
SUBST_STAGE.isocodes=	pre-configure

ICONDIR=		share/icons

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "NetBSD" && exists(/usr/include/sys/pset.h)
RT_LIB_SCHED=	rt
.else
RT_LIB_SCHED=	# empty
.endif
CMAKE_ARGS+=	-DRT_LIB_SCHED=${RT_LIB_SCHED}
CMAKE_ARGS+=	-DWITH_Xmms:BOOL=OFF

# genkdmconf wont install faces if using destdir so do it ourselves
INSTALLATION_DIRS+=	share/kde/apps/kdm/faces

post-install:
	${INSTALL_DATA} ${WRKSRC}/kdm/kfrontend/pics/default1.png \
		${DESTDIR}${PREFIX}/share/kde/apps/kdm/faces/.default.face.icon
	${INSTALL_DATA} ${WRKSRC}/kdm/kfrontend/pics/root1.png \
		${DESTDIR}${PREFIX}/share/kde/apps/kdm/faces/root.face.icon
	${INSTALL_DATA} ${DISTDIR}/NetBSD-flag-1.0.png \
		${DESTDIR}${PREFIX}/${ICONDIR}/NetBSD-flag.png
	${INSTALL_DATA} ${DISTDIR}/Daemon.png ${DESTDIR}${PREFIX}/${ICONDIR}
	${INSTALL_DATA} ${DISTDIR}/Daemon.README \
		${DESTDIR}${PREFIX}/share/doc/kde/HTML/en/kdm
.if ${OPSYS} == "NetBSD"
	@# NetBSD Advertisement O:-)
	cd ${DESTDIR}${PREFIX}/share/kde/config/kdm;			\
	${SED} -e 's|^\(LogoPixmap\)=.*|\1=${PREFIX}/${ICONDIR}/NetBSD-flag.png|' \
                kdmrc > ${WRKDIR}/kdmrc.ad;				\
	${CP} -f ${WRKDIR}/kdmrc.ad kdmrc
.endif
	${RM} ${DESTDIR}${PREFIX}/share/icons/oxygen/*/mimetypes/fonts-package.png

CFLAGS.SunOS+=	-D__EXTENSIONS__ -D__uint16_t=uint16_t
LDFLAGS.SunOS+=	-lsocket

BUILDLINK_DEPMETHOD.qt4-tools=	full
.include "../../meta-pkgs/kde4/kde4.mk"

.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../mk/libusb.buildlink3.mk"
.include "../../devel/qjson/buildlink3.mk"
.include "../../graphics/MesaLib/buildlink3.mk"
.if ${X11_TYPE} == "modular" && !empty(MESALIB_SUPPORTS_EGL:M[yY][eE][sS])
PLIST.gles=	yes
.elif exists(${X11BASE:Q}/include/GLES2/gl2.h)
PLIST.gles=	yes
.endif
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/qimageblitz/buildlink3.mk"
.include "../../security/polkit-qt/buildlink3.mk"
# not yet - causes kdm logins to fail, presumably because
#  I don't know how consolekit works
#.include "../../sysutils/consolekit/buildlink3.mk"
.include "../../sysutils/pciutils/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/iso-codes/buildlink3.mk"
.include "../../math/cln/buildlink3.mk"
.include "../../math/qalculate/buildlink3.mk"
#.include "../../misc/kdepimlibs4/buildlink3.mk"
#.include "../../misc/nepomuk-core/buildlink3.mk"
.include "../../multimedia/phonon/buildlink3.mk"
#.include "../../x11/py-kde4/buildlink3.mk"
.include "../../x11/libkactivities4/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../x11/libxklavier/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXres/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"
.include "../../x11/xcb-util-image/buildlink3.mk"
.include "../../x11/xcb-util-keysyms/buildlink3.mk"
.include "../../x11/xcb-util-renderutil/buildlink3.mk"

.include "../../mk/pam.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
