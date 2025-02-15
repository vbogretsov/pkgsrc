$NetBSD: patch-lib_hsh.c,v 1.1 2023/05/24 15:23:19 nikita Exp $

Upstream commit 3d5b287243f87ce0243b23abd690d86c41fc499c

lib/hsh.c: rename hsh local variable (#111)

The hsh local variable name conflicts with the function prototype of
hsh() in hsh.h, causing the following build issues with old compilers
(gcc 4.7):

hsh.c: In function 'hsh':
hsh.c:28:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]
hsh.c: In function 'hsh_buf':
hsh.c:60:21: error: declaration of 'hsh' shadows a global declaration [-Werror=shadow]
hsh.c:26:1: error: shadowed declaration is here [-Werror=shadow]

Therefore, we rename this local variable to _hsh.

diff --git a/lib/hsh.c b/lib/hsh.c
index c59a95f..a2a891b 100644
--- lib/hsh.c.orig
+++ lib/hsh.c
@@ -25,7 +25,7 @@
 json_t *
 hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
 {
-    jose_io_auto_t *hsh = NULL;
+    jose_io_auto_t *_hsh = NULL;
     jose_io_auto_t *enc = NULL;
     jose_io_auto_t *buf = NULL;
     char b[1024] = {};
@@ -33,8 +33,8 @@ hsh(jose_cfg_t *cfg, const char *alg, const void *data, size_t dlen)
 
     buf = jose_io_buffer(cfg, b, &l);
     enc = jose_b64_enc_io(buf);
-    hsh = hsh_io(cfg, alg, enc);
-    if (!buf || !enc || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
+    _hsh = hsh_io(cfg, alg, enc);
+    if (!buf || !enc || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
         return NULL;
 
     return json_stringn(b, l);
@@ -57,7 +57,7 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
         const void *data, size_t dlen, void *hash, size_t hlen)
 {
     const jose_hook_alg_t *a = NULL;
-    jose_io_auto_t *hsh = NULL;
+    jose_io_auto_t *_hsh = NULL;
     jose_io_auto_t *buf = NULL;
 
     a = jose_hook_alg_find(JOSE_HOOK_ALG_KIND_HASH, alg);
@@ -71,8 +71,8 @@ hsh_buf(jose_cfg_t *cfg, const char *alg,
         return SIZE_MAX;
 
     buf = jose_io_buffer(cfg, hash, &hlen);
-    hsh = a->hash.hsh(a, cfg, buf);
-    if (!buf || !hsh || !hsh->feed(hsh, data, dlen) || !hsh->done(hsh))
+    _hsh = a->hash.hsh(a, cfg, buf);
+    if (!buf || !_hsh || !_hsh->feed(_hsh, data, dlen) || !_hsh->done(_hsh))
         return SIZE_MAX;
 
     return hlen;
