# $NetBSD: buildlink3.mk,v 1.4 2006/04/12 10:27:42 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PYTK_BUILDLINK3_MK:=	${PYTK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pytk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npytk}
BUILDLINK_PACKAGES+=	pytk

.if !empty(PYTK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pytk+=	${PYPKGPREFIX}-Tk-[0-9]*
BUILDLINK_ABI_DEPENDS.pytk?=	${PYPKGPREFIX}-Tk>=0nb4
BUILDLINK_PKGSRCDIR.pytk?=	../../x11/py-Tk
.endif	# PYTK_BUILDLINK3_MK

.include "../../x11/tk/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
