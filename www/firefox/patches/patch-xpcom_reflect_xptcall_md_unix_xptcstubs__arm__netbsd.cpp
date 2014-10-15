$NetBSD: patch-xpcom_reflect_xptcall_md_unix_xptcstubs__arm__netbsd.cpp,v 1.1 2014/10/15 13:43:32 ryoon Exp $

--- xpcom/reflect/xptcall/md/unix/xptcstubs_arm_netbsd.cpp.orig	2014-10-11 09:06:50.000000000 +0000
+++ xpcom/reflect/xptcall/md/unix/xptcstubs_arm_netbsd.cpp
@@ -86,18 +86,23 @@ PrepareAndDispatch(nsXPTCStubBase* self,
  * so they are contiguous with values passed on the stack, and then calls
  * PrepareAndDispatch() to do the dirty work.
  */
+#ifndef	__ELF__
+#define	SYMBOLPREFIX	"_"
+#else
+#define	SYMBOLPREFIX
+#endif
 
 #define STUB_ENTRY(n)							\
 __asm__(								\
-    ".global	_Stub"#n"__14nsXPTCStubBase\n\t"			\
-"_Stub"#n"__14nsXPTCStubBase:\n\t"					\
+    ".global	"SYMBOLPREFIX"Stub"#n"__14nsXPTCStubBase\n\t"		\
+SYMBOLPREFIX"Stub"#n"__14nsXPTCStubBase:\n\t"				\
     "stmfd	sp!, {r1, r2, r3}	\n\t"				\
     "mov	ip, sp			\n\t"				\
     "stmfd	sp!, {fp, ip, lr, pc}	\n\t"				\
     "sub	fp, ip, #4		\n\t"				\
     "mov	r1, #"#n"		\n\t"    /* = methodIndex 	*/ \
     "add	r2, sp, #16		\n\t"				\
-    "bl		_PrepareAndDispatch__FP14nsXPTCStubBaseUiPUi   \n\t"	\
+    "bl		"SYMBOLPREFIX"PrepareAndDispatch__FP14nsXPTCStubBaseUiPUi   \n\t"	\
     "ldmea	fp, {fp, sp, lr}	\n\t"				\
     "add	sp, sp, #12		\n\t"				\
     "mov	pc, lr			\n\t"				\
