# $NetBSD: buildlink3.mk,v 1.4 2023/11/12 13:22:34 wiz Exp $

BUILDLINK_TREE+=	akonadi-mime

.if !defined(AKONADI_MIME_BUILDLINK3_MK)
AKONADI_MIME_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.akonadi-mime+=	akonadi-mime>=17.12.1
BUILDLINK_ABI_DEPENDS.akonadi-mime?=	akonadi-mime>=23.04.3nb3
BUILDLINK_PKGSRCDIR.akonadi-mime?=	../../mail/akonadi-mime

.include "../../mail/akonadi/buildlink3.mk"
.include "../../mail/kmime/buildlink3.mk"
.include "../../x11/qt5-qtbase/buildlink3.mk"
.endif	# AKONADI_MIME_BUILDLINK3_MK

BUILDLINK_TREE+=	-akonadi-mime
