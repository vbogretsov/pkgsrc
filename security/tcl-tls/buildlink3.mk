# $NetBSD: buildlink3.mk,v 1.4 2006/07/08 22:39:38 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
TCL_TLS_BUILDLINK3_MK:=	${TCL_TLS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	tcl-tls
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ntcl-tls}
BUILDLINK_PACKAGES+=	tcl-tls
BUILDLINK_ORDER+=	tcl-tls

.if !empty(TCL_TLS_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.tcl-tls+=	tcl-tls>=1.5.0
BUILDLINK_PKGSRCDIR.tcl-tls?=	../../security/tcl-tls
.endif	# TCL_TLS_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
