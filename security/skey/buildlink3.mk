# $NetBSD: buildlink3.mk,v 1.5 2006/04/12 10:27:34 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SKEY_BUILDLINK3_MK:=	${SKEY_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	skey
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nskey}
BUILDLINK_PACKAGES+=	skey

.if !empty(SKEY_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.skey+=	skey>=1.1.5
BUILDLINK_ABI_DEPENDS.skey?=	skey>=1.1.5nb2
BUILDLINK_PKGSRCDIR.skey?=	../../security/skey
BUILDLINK_DEPMETHOD.skey?=	build
.endif	# SKEY_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
