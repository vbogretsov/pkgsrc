# $NetBSD: buildlink3.mk,v 1.2 2008/04/27 09:21:27 wiz Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
GTK_SHARP_BUILDLINK3_MK:=	${GTK_SHARP_BUILDLINK3_MK}+

.if ${BUILDLINK_DEPTH} == "+"
BUILDLINK_DEPENDS+=	gtk-sharp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngtk-sharp}
BUILDLINK_PACKAGES+=	gtk-sharp
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}gtk-sharp

.if ${GTK_SHARP_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.gtk-sharp+=	gtk-sharp>=2.12.1
BUILDLINK_PKGSRCDIR.gtk-sharp?=		../../x11/gtk-sharp
.endif	# GTK_SHARP_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
