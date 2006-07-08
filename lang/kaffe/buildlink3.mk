# $NetBSD: buildlink3.mk,v 1.14 2006/07/08 22:39:23 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
KAFFE_BUILDLINK3_MK:=	${KAFFE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	kaffe
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nkaffe}
BUILDLINK_PACKAGES+=	kaffe
BUILDLINK_ORDER+=	kaffe

.if !empty(KAFFE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.kaffe+=	kaffe>=1.1.7
BUILDLINK_ABI_DEPENDS.kaffe?=	kaffe>=1.1.7
BUILDLINK_PKGSRCDIR.kaffe?=	../../lang/kaffe
BUILDLINK_JAVA_PREFIX.kaffe=	${PREFIX}/java/kaffe
.endif	# KAFFE_BUILDLINK3_MK

BUILDLINK_CPPFLAGS.kaffe= \
	-I${BUILDLINK_JAVA_PREFIX.kaffe}/include			\
	-I${BUILDLINK_JAVA_PREFIX.kaffe}/include/kaffe

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
