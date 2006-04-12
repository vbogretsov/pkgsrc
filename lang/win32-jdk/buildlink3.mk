# $NetBSD: buildlink3.mk,v 1.3 2006/04/12 10:27:22 rillig Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
WIN32_JDK_BUILDLINK3_MK:=	${WIN32_JRE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	win32-jdk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nwin32-jdk}
BUILDLINK_PACKAGES+=	win32-jdk

.if !empty(WIN32_JDK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.win32-jdk+=	win32-jre>=0.1
BUILDLINK_PKGSRCDIR.win32-jdk?=	../../lang/win32-jre
.endif	# WIN32_JDK_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
