# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:38:59 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
ZZIPLIB_BUILDLINK3_MK:=	${ZZIPLIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	zziplib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nzziplib}
BUILDLINK_PACKAGES+=	zziplib
BUILDLINK_ORDER+=	zziplib

.if !empty(ZZIPLIB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.zziplib+=	zziplib>=0.10.82
BUILDLINK_PKGSRCDIR.zziplib?=	../../archivers/zziplib
.endif	# ZZIPLIB_BUILDLINK3_MK

.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
