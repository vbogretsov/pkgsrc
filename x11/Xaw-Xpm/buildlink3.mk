# $NetBSD: buildlink3.mk,v 1.2 2004/08/27 18:53:58 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
XAW_XPM_BUILDLINK3_MK:=	${XAW_XPM_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	Xaw-Xpm
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NXaw-Xpm}
BUILDLINK_PACKAGES+=	Xaw-Xpm

.if !empty(XAW_XPM_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.Xaw-Xpm+=	Xaw-Xpm>=1.1
BUILDLINK_PKGSRCDIR.Xaw-Xpm?=	../../x11/Xaw-Xpm
.endif	# XAW_XPM_BUILDLINK3_MK

.include "../../mk/bsd.prefs.mk"

LIBXAW?=	-L${BUILDLINK_PREFIX.Xaw-Xpm}/lib			\
		${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.Xaw-Xpm}/lib	\
		-L${BUILDLINK_PREFIX.xpm}/lib				\
		${COMPILER_RPATH_FLAG}${BUILDLINK_PREFIX.xpm}/lib	\
		-lXaw3d -lXpm

.include "../../graphics/xpm/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
