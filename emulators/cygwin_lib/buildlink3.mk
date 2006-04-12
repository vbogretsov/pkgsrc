# $NetBSD: buildlink3.mk,v 1.3 2006/04/12 10:27:14 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CYGWIN_LIB_BUILDLINK3_MK:=	${CYGWIN_LIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	cygwin_lib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncygwin_lib}
BUILDLINK_PACKAGES+=	cygwin_lib

.if !empty(CYGWIN_LIB_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.cygwin_lib+=		cygwin_lib>=1.5.11.1
BUILDLINK_PKGSRCDIR.cygwin_lib?=	../../emulators/cygwin_lib
.endif	# CYGWIN_LIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
