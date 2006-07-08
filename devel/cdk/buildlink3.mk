# $NetBSD: buildlink3.mk,v 1.6 2006/07/08 22:39:07 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
CDK_BUILDLINK3_MK:=	${CDK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	cdk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ncdk}
BUILDLINK_PACKAGES+=	cdk
BUILDLINK_ORDER+=	cdk

.if !empty(CDK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.cdk+=		cdk>=4.9.9nb1
BUILDLINK_ABI_DEPENDS.cdk+=	cdk>=4.9.9nb2
BUILDLINK_PKGSRCDIR.cdk?=	../../devel/cdk
.endif	# CDK_BUILDLINK3_MK

USE_NCURSES=	yes

.include "../../devel/ncurses/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
