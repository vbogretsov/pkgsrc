# $NetBSD: buildlink3.mk,v 1.19 2005/07/07 11:46:55 tron Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
ZLIB_BUILDLINK3_MK:=	${ZLIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	zlib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nzlib}
BUILDLINK_PACKAGES+=	zlib

.if !empty(ZLIB_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.zlib+=	zlib>=1.1.4nb1
BUILDLINK_RECOMMENDED.zlib+=	zlib>=1.2.2nb1
BUILDLINK_PKGSRCDIR.zlib?=	../../devel/zlib
.endif	# ZLIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
