# $NetBSD: buildlink3.mk,v 1.7 2006/04/12 10:27:44 rillig Exp $

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH}+
XFCE4_WINDOWLIST_PLUGIN_BUILDLINK3_MK:=	${XFCE4_WINDOWLIST_PLUGIN_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	xfce4-windowlist-plugin
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nxfce4-windowlist-plugin}
BUILDLINK_PACKAGES+=	xfce4-windowlist-plugin

.if !empty(XFCE4_WINDOWLIST_PLUGIN_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.xfce4-windowlist-plugin+=	xfce4-windowlist-plugin>=0.1.0nb1
BUILDLINK_ABI_DEPENDS.xfce4-windowlist-plugin?=	xfce4-windowlist-plugin>=0.1.0nb3
BUILDLINK_PKGSRCDIR.xfce4-windowlist-plugin?=	../../x11/xfce4-windowlist-plugin
.endif	# XFCE4_WINDOWLIST_PLUGIN_BUILDLINK3_MK

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"

BUILDLINK_DEPTH:=			${BUILDLINK_DEPTH:S/+$//}
