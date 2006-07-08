# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:13 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NSPR_BUILDLINK3_MK:=	${NSPR_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	nspr
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnspr}
BUILDLINK_PACKAGES+=	nspr
BUILDLINK_ORDER+=	nspr

.if !empty(NSPR_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.nspr+=	nspr>=4.4.1nb1
BUILDLINK_ABI_DEPENDS.nspr+=	nspr>=4.6.1nb1
BUILDLINK_PKGSRCDIR.nspr?=	../../devel/nspr

BUILDLINK_FILES.nspr+=		lib/nspr/*
BUILDLINK_FILES.nspr+=		include/nspr/*

BUILDLINK_INCDIRS.nspr+=	include/nspr
BUILDLINK_LIBDIRS.nspr+=	lib/nspr
BUILDLINK_RPATHDIRS.nspr+=	lib/nspr

.endif	# NSPR_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
