# $NetBSD: buildlink3.mk,v 1.4 2006/04/12 10:27:26 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
TASP_VSIPL_BUILDLINK3_MK:=	${TASP_VSIPL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	tasp-vsipl
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ntasp-vsipl}
BUILDLINK_PACKAGES+=	tasp-vsipl

.if !empty(TASP_VSIPL_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.tasp-vsipl+=	tasp-vsipl>=20030710
BUILDLINK_ABI_DEPENDS.tasp-vsipl?=	tasp-vsipl>=20030710nb1
BUILDLINK_PKGSRCDIR.tasp-vsipl?=	../../math/tasp-vsipl
.endif	# TASP_VSIPL_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
