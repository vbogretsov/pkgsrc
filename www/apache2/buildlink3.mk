# $NetBSD: buildlink3.mk,v 1.1 2004/03/08 00:15:53 minskim Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
APACHE_BUILDLINK3_MK:=	${APACHE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	apache
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Napache}
BUILDLINK_PACKAGES+=	apache

.if !empty(APACHE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.apache+=	apache>=2.0.48nb3
BUILDLINK_PKGSRCDIR.apache?=	../../www/apache2
BUILDLINK_DEPMETHOD.apache?=	build

USE_PERL5?=			build	# for "apxs"

.if defined(APACHE_MODULE)
BUILDLINK_DEPMETHOD.apache+=	full
.endif

.include "../../devel/apr/buildlink3.mk"

APXS?=			${BUILDLINK_PREFIX.apache}/sbin/apxs
.if defined(GNU_CONFIGURE)
CONFIGURE_ARGS+=	--with-apxs2="${APXS}"
.endif

.endif	# APACHE_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
