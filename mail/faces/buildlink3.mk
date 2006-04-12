# $NetBSD: buildlink3.mk,v 1.6 2006/04/12 10:27:23 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
FACES_BUILDLINK3_MK:=	${FACES_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	faces
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nfaces}
BUILDLINK_PACKAGES+=	faces

.if !empty(FACES_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.faces+=	faces>=1.6.1nb1
BUILDLINK_ABI_DEPENDS.faces+=	faces>=1.6.1nb4
BUILDLINK_PKGSRCDIR.faces?=	../../mail/faces
.endif	# FACES_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
