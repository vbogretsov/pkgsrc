# $NetBSD: buildlink3.mk,v 1.1 2004/04/27 02:04:07 snj Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
PY_GNOME_BUILDLINK3_MK:=	${PY_GNOME_BUILDLINK3_MK}+

.include "../../lang/python/pyversion.mk"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pygnome
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npygnome}
BUILDLINK_PACKAGES+=	pygnome

.if !empty(PY_GNOME_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.pygnome+=	${PYPKGPREFIX}-gnome>=1.4.4nb4
BUILDLINK_RECOMMENDED.pygnome+=	${PYPKGPREFIX}-gnome>=1.4.4nb5
BUILDLINK_PKGSRCDIR.pygnome?=	../../x11/gnome-python
.endif	# PY_GNOME_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
