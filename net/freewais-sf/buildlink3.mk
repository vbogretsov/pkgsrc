# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:32 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
FREEWAIS_SF_BUILDLINK3_MK:=	${FREEWAIS_SF_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	freewais-sf
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfreewais-sf}
BUILDLINK_PACKAGES+=	freewais-sf
BUILDLINK_ORDER+=	freewais-sf

.if !empty(FREEWAIS_SF_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.freewais-sf+=	freewais-sf>=2.2.12
BUILDLINK_ABI_DEPENDS.freewais-sf+=	freewais-sf>=2.2.12nb2
BUILDLINK_PKGSRCDIR.freewais-sf?=	../../net/freewais-sf
.endif	# FREEWAIS_SF_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
