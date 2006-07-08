# $NetBSD: buildlink3.mk,v 1.4 2006/07/08 22:39:11 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBNET_BUILDLINK3_MK:=	${LIBNET_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libnet
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibnet}
BUILDLINK_PACKAGES+=	libnet
BUILDLINK_ORDER+=	libnet

.if !empty(LIBNET_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libnet+=	libnet>=1.1.2.1
BUILDLINK_PKGSRCDIR.libnet?=	../../devel/libnet11
.endif	# LIBNET_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
