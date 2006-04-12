# $NetBSD: buildlink3.mk,v 1.3 2006/04/12 10:27:25 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DJBFFT_BUILDLINK3_MK:=	${DJBFFT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	djbfft
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndjbfft}
BUILDLINK_PACKAGES+=	djbfft

.if !empty(DJBFFT_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.djbfft+=	djbfft>=0.76
BUILDLINK_PKGSRCDIR.djbfft?=	../../math/djbfft
BUILDLINK_DEPMETHOD.djbfft?=	build
.endif	# DJBFFT_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
