# $NetBSD: buildlink3.mk,v 1.6 2023/08/14 05:25:08 wiz Exp $

BUILDLINK_TREE+=	botan

.if !defined(BOTAN_BUILDLINK3_MK)
BOTAN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.botan+=	botan>=2.11
BUILDLINK_ABI_DEPENDS.botan+=	botan>=2.19.3nb3
BUILDLINK_PKGSRCDIR.botan?=	../../security/botan2

.include "../../devel/zlib/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.endif # BOTAN_BUILDLINK3_MK

BUILDLINK_TREE+=	-botan
