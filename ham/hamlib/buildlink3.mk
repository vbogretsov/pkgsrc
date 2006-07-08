# $NetBSD: buildlink3.mk,v 1.7 2006/07/08 22:39:21 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
HAMLIB_BUILDLINK3_MK:=	${HAMLIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	hamlib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nhamlib}
BUILDLINK_PACKAGES+=	hamlib
BUILDLINK_ORDER+=	hamlib

.if !empty(HAMLIB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.hamlib+=	hamlib>=1.1.4
BUILDLINK_ABI_DEPENDS.hamlib+=	hamlib>=1.2.5
BUILDLINK_PKGSRCDIR.hamlib?=	../../ham/hamlib
.endif	# HAMLIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
