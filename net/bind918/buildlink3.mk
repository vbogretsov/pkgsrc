# $NetBSD: buildlink3.mk,v 1.1 2022/12/11 01:57:55 sekiya Exp $

BUILDLINK_TREE+=	bind

.if !defined(BIND_BUILDLINK3_MK)
BIND_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.bind+=	bind>=9.18.0
BUILDLINK_ABI_DEPENDS.bind?=	bind>=9.18.30nb1
BUILDLINK_PKGSRCDIR.bind?=	../../net/bind918
.endif # BIND_BUILDLINK3_MK

BUILDLINK_TREE+=	-bind
