# $NetBSD: buildlink3.mk,v 1.4 2006/07/08 22:39:24 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SWI_PROLOG_LITE_BUILDLINK3_MK:=	${SWI_PROLOG_LITE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	swi-prolog-lite
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nswi-prolog-lite}
BUILDLINK_PACKAGES+=	swi-prolog-lite
BUILDLINK_ORDER+=	swi-prolog-lite

.if !empty(SWI_PROLOG_LITE_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.swi-prolog-lite+=	swi-prolog-lite>=5.2.9
BUILDLINK_PKGSRCDIR.swi-prolog-lite?=	../../lang/swi-prolog-lite
.endif	# SWI_PROLOG_LITE_BUILDLINK3_MK

.include "../../devel/ncurses/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
