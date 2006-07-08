# $NetBSD: buildlink3.mk,v 1.10 2006/07/08 22:39:41 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PYXML_BUILDLINK3_MK:=	${PYXML_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pyxml
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npyxml}
BUILDLINK_PACKAGES+=	pyxml
BUILDLINK_ORDER+=	pyxml

.if !empty(PYXML_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.pyxml+=	${PYPKGPREFIX}-xml>=0.8.3nb1
BUILDLINK_ABI_DEPENDS.pyxml?=	${PYPKGPREFIX}-xml>=0.8.4nb2
BUILDLINK_PKGSRCDIR.pyxml?=	../../textproc/py-xml
.endif	# PYXML_BUILDLINK3_MK

.include "../../textproc/expat/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
