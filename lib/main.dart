import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mondoli_test/routes/app_pages.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Listener(
      behavior: HitTestBehavior.opaque,
      onPointerDown: (_) {
        // FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        builder: (context, child) => ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 450, name: MOBILE),
            const Breakpoint(start: 451, end: 800, name: TABLET),
            const Breakpoint(start: 801, end: 1920, name: DESKTOP),
            const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        ),
        debugShowCheckedModeBanner: false,
        enableLog: true,
        initialRoute: AppPages.initial,
        getPages: AppPages.routes,
      ),
    );
  }
}
