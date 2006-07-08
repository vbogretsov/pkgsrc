# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:14 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
RVM_BUILDLINK3_MK:=	${RVM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	rvm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nrvm}
BUILDLINK_PACKAGES+=	rvm
BUILDLINK_ORDER+=	rvm

.if !empty(RVM_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.rvm+=	rvm>=1.3
BUILDLINK_ABI_DEPENDS.rvm+=	rvm>=1.11nb1
BUILDLINK_PKGSRCDIR.rvm?=	../../devel/rvm
.endif	# RVM_BUILDLINK3_MK

.include "../../devel/lwp/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
