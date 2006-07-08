# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:28 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NTL_BUILDLINK3_MK:=	${NTL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ntl
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nntl}
BUILDLINK_PACKAGES+=	ntl
BUILDLINK_ORDER+=	ntl

.if !empty(NTL_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.ntl+=	ntl>=5.3.1
BUILDLINK_ABI_DEPENDS.ntl+=	ntl>=5.3.1nb1
BUILDLINK_PKGSRCDIR.ntl?=	../../math/ntl
.endif	# NTL_BUILDLINK3_MK

.include "../../devel/gmp/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
