# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:40 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
BTPARSE_BUILDLINK3_MK:=	${BTPARSE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	btparse
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nbtparse}
BUILDLINK_PACKAGES+=	btparse
BUILDLINK_ORDER+=	btparse

.if !empty(BTPARSE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.btparse+=	btparse>=0.34
BUILDLINK_PKGSRCDIR.btparse?=	../../textproc/btparse
.endif	# BTPARSE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
