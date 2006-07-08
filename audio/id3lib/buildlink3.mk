# $NetBSD: buildlink3.mk,v 1.8 2006/07/08 22:39:00 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
ID3LIB_BUILDLINK3_MK:=	${ID3LIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	id3lib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nid3lib}
BUILDLINK_PACKAGES+=	id3lib
BUILDLINK_ORDER+=	id3lib

.if !empty(ID3LIB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.id3lib+=	id3lib>=3.8.3
BUILDLINK_ABI_DEPENDS.id3lib+=	id3lib>=3.8.3nb1
BUILDLINK_PKGSRCDIR.id3lib?=	../../audio/id3lib
.endif	# ID3LIB_BUILDLINK3_MK

.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
