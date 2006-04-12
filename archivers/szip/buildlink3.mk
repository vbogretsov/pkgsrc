# $NetBSD: buildlink3.mk,v 1.4 2006/04/12 10:26:59 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SZIP_BUILDLINK3_MK:=	${SZIP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	szip
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nszip}
BUILDLINK_PACKAGES+=	szip

.if !empty(SZIP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.szip+=	szip>=2.0
BUILDLINK_PKGSRCDIR.szip?=	../../archivers/szip
.endif	# SZIP_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
