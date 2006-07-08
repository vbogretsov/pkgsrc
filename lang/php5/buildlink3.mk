# $NetBSD: buildlink3.mk,v 1.12 2006/07/08 22:39:23 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PHP_BUILDLINK3_MK:=	${PHP_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	php
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nphp}
BUILDLINK_PACKAGES+=	php
BUILDLINK_ORDER+=	php

.if !empty(PHP_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.php+=		php>=5.1.2
BUILDLINK_ABI_DEPENDS.php+=	php>=5.1.2
BUILDLINK_PKGSRCDIR.php?=	../../lang/php5
.endif	# PHP_BUILDLINK3_MK

.include "../../textproc/libxml2/buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
