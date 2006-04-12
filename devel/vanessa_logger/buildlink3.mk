# $NetBSD: buildlink3.mk,v 1.4 2006/04/12 10:27:14 rillig Exp $
#
# This file was created automatically using createbuildlink-3.5.

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
VANESSA_LOGGER_BUILDLINK3_MK:=	${VANESSA_LOGGER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	vanessa_logger
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nvanessa_logger}
BUILDLINK_PACKAGES+=	vanessa_logger

.if !empty(VANESSA_LOGGER_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.vanessa_logger+=	vanessa_logger>=0.0.7
BUILDLINK_ABI_DEPENDS.vanessa_logger+=	vanessa_logger>=0.0.7nb1
BUILDLINK_PKGSRCDIR.vanessa_logger?=	../../devel/vanessa_logger
.endif	# VANESSA_LOGGER_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
