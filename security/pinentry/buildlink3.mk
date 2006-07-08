# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:38 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PINENTRY_BUILDLINK3_MK:=	${PINENTRY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pinentry
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npinentry}
BUILDLINK_PACKAGES+=	pinentry
BUILDLINK_ORDER+=	pinentry

.if !empty(PINENTRY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pinentry+=	pinentry>=0.7.1
BUILDLINK_ABI_DEPENDS.pinentry+=	pinentry>=0.7.1nb3
BUILDLINK_PKGSRCDIR.pinentry?=	../../security/pinentry
.endif	# PINENTRY_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
