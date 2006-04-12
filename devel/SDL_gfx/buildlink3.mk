# $NetBSD: buildlink3.mk,v 1.6 2006/04/12 10:27:06 rillig Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
SDL_GFX_BUILDLINK3_MK:=	${SDL_GFX_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	SDL_gfx
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NSDL_gfx}
BUILDLINK_PACKAGES+=	SDL_gfx

.if !empty(SDL_GFX_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.SDL_gfx+=	SDL_gfx>=2.0.3nb2
BUILDLINK_ABI_DEPENDS.SDL_gfx?=	SDL_gfx>=2.0.13nb3
BUILDLINK_PKGSRCDIR.SDL_gfx?=	../../devel/SDL_gfx
.endif	# SDL_GFX_BUILDLINK3_MK

.include "../../devel/SDL/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
