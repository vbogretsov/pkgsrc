# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:44 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SOPE_BUILDLINK3_MK:=	${SOPE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	sope
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsope}
BUILDLINK_PACKAGES+=	sope
BUILDLINK_ORDER+=	sope

.if !empty(SOPE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.sope+=	sope>=4.5.4nb2
BUILDLINK_ABI_DEPENDS.sope?=	sope>=4.5.4nb3
BUILDLINK_PKGSRCDIR.sope?=	../../www/sope
.endif	# SOPE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
