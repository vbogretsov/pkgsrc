$NetBSD: patch-operations_external_svg-load.c,v 1.1 2023/11/12 09:22:23 nros Exp $

* fix build with librsvg-c, from upstream
https://gitlab.gnome.org/GNOME/gegl/-/commit/a99a93e5c9013bd4101f5058cdee7d0cf30234fe

--- operations/external/svg-load.c.orig	2023-06-25 22:49:19.000000000 +0000
+++ operations/external/svg-load.c
@@ -76,16 +76,25 @@ query_svg (GeglOperation *operation)
 {
   GeglProperties *o = GEGL_PROPERTIES (operation);
   Priv *p = (Priv*) o->user_data;
+#if LIBRSVG_CHECK_VERSION(2, 52, 0)
   gdouble out_width, out_height;
+#else
+  RsvgDimensionData dimensions;
+#endif
 
   g_return_val_if_fail (p->handle != NULL, FALSE);
 
-  rsvg_handle_get_intrinsic_size_in_pixels (p->handle, &out_width, &out_height);
-
   p->format = babl_format ("R'G'B'A u8");
 
+#if LIBRSVG_CHECK_VERSION(2, 52, 0)
+  rsvg_handle_get_intrinsic_size_in_pixels (p->handle, &out_width, &out_height);
   p->height = out_height;
-  p->width = out_width;
+  p->width  = out_width;
+#else
+  rsvg_handle_get_dimensions (p->handle, &dimensions);
+  p->height = dimensions.height;
+  p->width  = dimensions.width;
+#endif
 
   return TRUE;
 }
@@ -98,10 +107,12 @@ load_svg (GeglOperation *operation,
 {
     GeglProperties    *o = GEGL_PROPERTIES (operation);
     Priv              *p = (Priv*) o->user_data;
-    RsvgRectangle      svg_rect = {0.0, 0.0, width, height};
     cairo_surface_t   *surface;
     cairo_t           *cr;
-    GError            *error = NULL;
+#if LIBRSVG_CHECK_VERSION(2, 52, 0)
+    GError            *error    = NULL;
+    RsvgRectangle      svg_rect = {0.0, 0.0, width, height};
+#endif
 
     g_return_val_if_fail (p->handle != NULL, -1);
 
@@ -115,7 +126,11 @@ load_svg (GeglOperation *operation,
                      (double)height / (double)p->height);
       }
 
+#if LIBRSVG_CHECK_VERSION(2, 52, 0)
     rsvg_handle_render_document (p->handle, cr, &svg_rect, &error);
+#else
+    rsvg_handle_render_cairo (p->handle, cr);
+#endif
 
     cairo_surface_flush (surface);
 
