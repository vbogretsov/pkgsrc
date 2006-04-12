# $NetBSD: buildlink3.mk,v 1.11 2006/04/12 10:27:33 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBGCRYPT_BUILDLINK3_MK:=	${LIBGCRYPT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libgcrypt
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibgcrypt}
BUILDLINK_PACKAGES+=	libgcrypt

.if !empty(LIBGCRYPT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libgcrypt+=	libgcrypt>=1.2.0
BUILDLINK_ABI_DEPENDS.libgcrypt+=	libgcrypt>=1.2.2nb1
BUILDLINK_PKGSRCDIR.libgcrypt?=	../../security/libgcrypt
.endif	# LIBGCRYPT_BUILDLINK3_MK

.include "../../security/libgpg-error/buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
