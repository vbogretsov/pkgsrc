# $NetBSD: Makefile,v 1.35 2023/07/06 09:40:10 wiz Exp $

DISTNAME=	Test-Compile-v3.2.2
PKGNAME=	p5-${DISTNAME:S/-v/-/}
PKGREVISION=	1
CATEGORIES=	devel perl5
MASTER_SITES=	${MASTER_SITE_PERL_CPAN:=Test/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	https://metacpan.org/release/Test-Compile
COMMENT=	Perl 5 module to check whether Perl module files compile correctly
LICENSE=	${PERL5_LICENSE}

TEST_DEPENDS+=	p5-Devel-CheckOS-[0-9]*:../../devel/p5-Devel-CheckOS
TEST_DEPENDS+=	p5-Test-Warnings-[0-9]*:../../devel/p5-Test-Warnings

USE_LANGUAGES=		# empty
PERL5_PACKLIST=		auto/Test/Compile/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
