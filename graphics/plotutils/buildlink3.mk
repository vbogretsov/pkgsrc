# $NetBSD: buildlink3.mk,v 1.9 2006/07/08 22:39:20 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PLOTUTILS_BUILDLINK3_MK:=	${PLOTUTILS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	plotutils
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nplotutils}
BUILDLINK_PACKAGES+=	plotutils
BUILDLINK_ORDER+=	plotutils

.if !empty(PLOTUTILS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.plotutils+=	plotutils>=2.4.1nb2
BUILDLINK_ABI_DEPENDS.plotutils+=	plotutils>=2.4.1nb5
BUILDLINK_PKGSRCDIR.plotutils?=	../../graphics/plotutils
.endif	# PLOTUTILS_BUILDLINK3_MK

.include "../../graphics/png/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
