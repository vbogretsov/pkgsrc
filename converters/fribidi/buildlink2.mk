# $NetBSD: buildlink2.mk,v 1.3 2004/04/15 00:49:29 wiz Exp $
#
# This Makefile fragment is included by packages that use fribidi.
#
# This file was created automatically using createbuildlink 2.7.
#

.if !defined(FRIBIDI_BUILDLINK2_MK)
FRIBIDI_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			fribidi
BUILDLINK_DEPENDS.fribidi?=		fribidi>=0.10.4
BUILDLINK_PKGSRCDIR.fribidi?=		../../converters/fribidi

EVAL_PREFIX+=	BUILDLINK_PREFIX.fribidi=fribidi
BUILDLINK_PREFIX.fribidi_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.fribidi+=	include/fribidi/*.h
BUILDLINK_FILES.fribidi+=	lib/libfribidi.*

BUILDLINK_TARGETS+=	fribidi-buildlink

fribidi-buildlink: _BUILDLINK_USE

.endif	# FRIBIDI_BUILDLINK2_MK
