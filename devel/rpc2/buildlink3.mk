# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:14 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
RPC2_BUILDLINK3_MK:=	${RPC2_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	rpc2
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nrpc2}
BUILDLINK_PACKAGES+=	rpc2
BUILDLINK_ORDER+=	rpc2

.if !empty(RPC2_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.rpc2+=	rpc2>=1.10
BUILDLINK_ABI_DEPENDS.rpc2+=	rpc2>=1.27nb1
BUILDLINK_PKGSRCDIR.rpc2?=	../../devel/rpc2
.endif	# RPC2_BUILDLINK3_MK

.include "../../devel/lwp/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
