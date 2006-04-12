# $NetBSD: buildlink3.mk,v 1.7 2006/04/12 10:27:34 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBTASN1_BUILDLINK3_MK:=	${LIBTASN1_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libtasn1
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibtasn1}
BUILDLINK_PACKAGES+=	libtasn1

.if !empty(LIBTASN1_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libtasn1+=	libtasn1>=0.2.7
BUILDLINK_ABI_DEPENDS.libtasn1+=	libtasn1>=0.3.0
BUILDLINK_PKGSRCDIR.libtasn1?=	../../security/libtasn1
.endif	# LIBTASN1_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
