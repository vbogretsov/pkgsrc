# $NetBSD: buildlink3.mk,v 1.9 2006/07/08 22:39:23 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PNETLIB_BUILDLINK3_MK:=	${PNETLIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pnetlib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npnetlib}
BUILDLINK_PACKAGES+=	pnetlib
BUILDLINK_ORDER+=	pnetlib

.if !empty(PNETLIB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pnetlib+=	pnetlib>=0.6.4
BUILDLINK_ABI_DEPENDS.pnetlib+=	pnetlib>=0.6.6nb2
BUILDLINK_PKGSRCDIR.pnetlib?=	../../lang/pnetlib
.endif	# PNETLIB_BUILDLINK3_MK

.include "../../lang/pnet/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
