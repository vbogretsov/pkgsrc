# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:41 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
HRE_BUILDLINK3_MK:=	${HRE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	hre
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nhre}
BUILDLINK_PACKAGES+=	hre
BUILDLINK_ORDER+=	hre

.if !empty(HRE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.hre+=		hre>=0.9.7
BUILDLINK_ABI_DEPENDS.hre+=	hre>=0.9.8anb1
BUILDLINK_PKGSRCDIR.hre?=	../../textproc/hre
.endif	# HRE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
