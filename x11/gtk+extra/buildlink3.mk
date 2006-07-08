# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:45 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GTK+EXTRA_BUILDLINK3_MK:=	${GTK+EXTRA_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gtk+extra
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngtk+extra}
BUILDLINK_PACKAGES+=	gtk+extra
BUILDLINK_ORDER+=	gtk+extra

.if !empty(GTK+EXTRA_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gtk+extra+=	gtk+extra>=0.99.17nb2
BUILDLINK_ABI_DEPENDS.gtk+extra?=	gtk+extra>=0.99.17nb5
BUILDLINK_PKGSRCDIR.gtk+extra?=	../../x11/gtk+extra
.endif	# GTK+EXTRA_BUILDLINK3_MK

.include "../../x11/gtk/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
