# $NetBSD: buildlink3.mk,v 1.11 2006/07/08 22:39:33 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
NETATALK_BUILDLINK3_MK:=	${NETATALK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	netatalk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnetatalk}
BUILDLINK_PACKAGES+=	netatalk
BUILDLINK_ORDER+=	netatalk

.if !empty(NETATALK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.netatalk+=	netatalk>=2.0.3nb2
BUILDLINK_ABI_DEPENDS.netatalk?=	netatalk>=2.0.3nb3
BUILDLINK_PKGSRCDIR.netatalk?=	../../net/netatalk
BUILDLINK_DEPMETHOD.netatalk?=	build
.endif	# NETATALK_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
