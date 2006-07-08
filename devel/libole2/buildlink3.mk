# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:12 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBOLE2_BUILDLINK3_MK:=	${LIBOLE2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libole2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibole2}
BUILDLINK_PACKAGES+=	libole2
BUILDLINK_ORDER+=	libole2

.if !empty(LIBOLE2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libole2+=	libole2>=0.2.4nb1
BUILDLINK_ABI_DEPENDS.libole2+=	libole2>=0.2.4nb2
BUILDLINK_PKGSRCDIR.libole2?=	../../devel/libole2
.endif	# LIBOLE2_BUILDLINK3_MK

.include "../../devel/glib/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
