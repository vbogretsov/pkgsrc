# $NetBSD: buildlink3.mk,v 1.8 2006/04/12 10:27:02 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SPEEX_BUILDLINK3_MK:=	${SPEEX_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	speex
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nspeex}
BUILDLINK_PACKAGES+=	speex

.if !empty(SPEEX_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.speex+=	speex>=1.0.4
BUILDLINK_ABI_DEPENDS.speex+=	speex>=1.0.4nb1
BUILDLINK_PKGSRCDIR.speex?=	../../audio/speex
.endif	# SPEEX_BUILDLINK3_MK

.include "../../multimedia/libogg/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
