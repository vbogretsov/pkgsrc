# $NetBSD: buildlink3.mk,v 1.4 2006/07/08 22:39:12 jlam Exp $

BUILDLINK_DEPMETHOD.libts?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBTS_BUILDLINK3_MK:=	${LIBTS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libts
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibts}
BUILDLINK_PACKAGES+=	libts
BUILDLINK_ORDER+=	libts

.if !empty(LIBTS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libts+=	libts>=1.08
BUILDLINK_PKGSRCDIR.libts?=	../../devel/libts
.endif	# LIBTS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
