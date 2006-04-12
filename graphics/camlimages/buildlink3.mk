# $NetBSD: buildlink3.mk,v 1.6 2006/04/12 10:27:17 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CAMLIMAGES_BUILDLINK3_MK:=	${CAMLIMAGES_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	camlimages
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncamlimages}
BUILDLINK_PACKAGES+=	camlimages

.if !empty(CAMLIMAGES_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.camlimages+=	camlimages>=2.2.0
BUILDLINK_ABI_DEPENDS.camlimages?=	camlimages>=2.2.0nb1
BUILDLINK_PKGSRCDIR.camlimages?=	../../graphics/camlimages
.endif	# CAMLIMAGES_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
