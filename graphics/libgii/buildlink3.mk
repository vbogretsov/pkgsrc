# $NetBSD: buildlink3.mk,v 1.7 2006/04/12 10:27:18 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBGII_BUILDLINK3_MK:=	${LIBGII_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libgii
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibgii}
BUILDLINK_PACKAGES+=	libgii

.if !empty(LIBGII_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.libgii+=	libgii>=0.9.0
BUILDLINK_ABI_DEPENDS.libgii?=	libgii>=0.9.1nb1
BUILDLINK_PKGSRCDIR.libgii?=	../../graphics/libgii
.endif	# LIBGII_BUILDLINK3_MK

.include "../../mk/x11.buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
