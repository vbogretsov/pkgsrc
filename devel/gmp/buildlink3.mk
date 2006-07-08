# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 22:39:09 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GMP_BUILDLINK3_MK:=	${GMP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gmp
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngmp}
BUILDLINK_PACKAGES+=	gmp
BUILDLINK_ORDER+=	gmp

.if !empty(GMP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gmp+=		gmp>=4.1.2
BUILDLINK_ABI_DEPENDS.gmp+=	gmp>=4.1.3nb1
BUILDLINK_PKGSRCDIR.gmp?=	../../devel/gmp
.endif	# GMP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
