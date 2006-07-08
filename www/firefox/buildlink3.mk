# $NetBSD: buildlink3.mk,v 1.13 2006/07/08 22:39:43 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
FIREFOX_BUILDLINK3_MK:=		${FIREFOX_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=		firefox
.endif

BUILDLINK_PACKAGES:=		${BUILDLINK_PACKAGES:Nfirefox}
BUILDLINK_PACKAGES+=		firefox
BUILDLINK_ORDER+=		firefox

.if !empty(FIREFOX_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.firefox+=	firefox>=1.5
BUILDLINK_ABI_DEPENDS.firefox+=	firefox>=1.5.0.1nb1
BUILDLINK_PKGSRCDIR.firefox?=	../../www/firefox
.endif	# FIREFOX_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
