# $NetBSD: buildlink3.mk,v 1.3 2023/11/29 10:53:11 jperkin Exp $

BUILDLINK_TREE+=	py-pybind11

.if !defined(PY_PYBIND11_BUILDLINK3_MK)
PY_PYBIND11_BUILDLINK3_MK:=

# As this package defaults to DEPMETHOD=build we also set python to default
# to build, and avoid pulling in unwanted indirect buildlink3 dependencies.
PYTHON_FOR_BUILD_ONLY?=		yes
.include "../../lang/python/pyversion.mk"

BUILDLINK_API_DEPENDS.py-pybind11+=	${PYPKGPREFIX}-pybind11>=2.5.0
BUILDLINK_PKGSRCDIR.py-pybind11?=	../../devel/py-pybind11
BUILDLINK_DEPMETHOD.py-pybind11?=	build

.endif	# PY_PYBIND11_BUILDLINK3_MK

BUILDLINK_TREE+=	-py-pybind11
