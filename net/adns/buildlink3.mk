# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:32 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
ADNS_BUILDLINK3_MK:=	${ADNS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	adns
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nadns}
BUILDLINK_PACKAGES+=	adns
BUILDLINK_ORDER+=	adns

.if !empty(ADNS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.adns+=	adns>=1.0
BUILDLINK_ABI_DEPENDS.adns+=	adns>=1.1nb2
BUILDLINK_PKGSRCDIR.adns?=	../../net/adns
.endif	# ADNS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
