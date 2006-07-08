# $NetBSD: buildlink3.mk,v 1.5 2006/07/08 22:39:14 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PYREADLINE_BUILDLINK3_MK:=	${PYREADLINE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pyreadline
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npyreadline}
BUILDLINK_PACKAGES+=	pyreadline
BUILDLINK_ORDER+=	pyreadline

.if !empty(PYREADLINE_BUILDLINK3_MK:M+)

.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.pyreadline+=		${PYPKGPREFIX}-readline-[0-9]*
BUILDLINK_ABI_DEPENDS.pyreadline?=	${PYPKGPREFIX}-readline>=0nb2
BUILDLINK_PKGSRCDIR.pyreadline?=	../../devel/py-readline

.endif	# PYREADLINE_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
