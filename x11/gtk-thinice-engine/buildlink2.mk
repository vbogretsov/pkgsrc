# $NetBSD: buildlink2.mk,v 1.6 2004/04/15 00:49:29 wiz Exp $
#
# This Makefile fragment is included by packages that use gtk-thinice-engine.
#
# This file was created automatically using createbuildlink 2.6.
#

.if !defined(GTK_THINICE_ENGINE_BUILDLINK2_MK)
GTK_THINICE_ENGINE_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			gtk-thinice-engine
BUILDLINK_DEPENDS.gtk-thinice-engine?=		gtk-thinice-engine>=2.0.2nb2
BUILDLINK_PKGSRCDIR.gtk-thinice-engine?=		../../x11/gtk-thinice-engine

EVAL_PREFIX+=	BUILDLINK_PREFIX.gtk-thinice-engine=gtk-thinice-engine
BUILDLINK_PREFIX.gtk-thinice-engine_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.gtk-thinice-engine+=	lib/gtk-2.0/2.2.0/engines/libthinice.*

.include "../../devel/gettext-lib/buildlink2.mk"
.include "../../x11/gtk2/buildlink2.mk"

BUILDLINK_TARGETS+=	gtk-thinice-engine-buildlink

gtk-thinice-engine-buildlink: _BUILDLINK_USE

.endif	# GTK_THINICE_ENGINE_BUILDLINK2_MK
