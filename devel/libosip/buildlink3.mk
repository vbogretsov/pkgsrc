# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:12 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBOSIP2_BUILDLINK3_MK:=	${LIBOSIP2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libosip2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibosip2}
BUILDLINK_PACKAGES+=	libosip2
BUILDLINK_ORDER+=	libosip2

.if !empty(LIBOSIP2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libosip2+=	libosip2>=2.2.0
BUILDLINK_ABI_DEPENDS.libosip2+=	libosip2>=2.2.0
BUILDLINK_PKGSRCDIR.libosip2?=	../../devel/libosip
.endif	# LIBOSIP2_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
