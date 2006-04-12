# $NetBSD: buildlink3.mk,v 1.5 2006/04/12 10:27:04 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
IODBC_BUILDLINK3_MK:=	${IODBC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	iodbc
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Niodbc}
BUILDLINK_PACKAGES+=	iodbc

.if !empty(IODBC_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.iodbc+=	iodbc>=3.52.3
BUILDLINK_PKGSRCDIR.iodbc?=	../../databases/iodbc
.endif	# IODBC_BUILDLINK3_MK

# ODBC drivers don't need these bits, but ODBC clients do.
.if !defined(ODBC_DRIVER)
.  include "../../mk/dlopen.buildlink3.mk"
.  include "../../mk/pthread.buildlink3.mk"
.endif

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
