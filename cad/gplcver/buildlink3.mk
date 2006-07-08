# $NetBSD: buildlink3.mk,v 1.4 2006/07/08 22:39:02 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GPLCVER_BUILDLINK3_MK:=	${GPLCVER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gplcver
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngplcver}
BUILDLINK_PACKAGES+=	gplcver
BUILDLINK_ORDER+=	gplcver

.if !empty(GPLCVER_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.gplcver+=	gplcver>=2.11a
BUILDLINK_PKGSRCDIR.gplcver?=	../../cad/gplcver
.endif	# GPLCVER_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
