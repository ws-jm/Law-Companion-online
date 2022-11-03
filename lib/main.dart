import 'package:desktop_webview_window/desktop_webview_window.dart';
import 'package:flutter/material.dart';
import 'package:ftv2/page/ui/payment_page.dart';
import 'package:get/get.dart';
import 'dependency_injection.dart';
import 'route/app_module.dart';
import 'route/route.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  debugPrint('args: $args');
  if (runWebViewTitleBarWidget(args)) {
    return;
  }
//   if(Platform.isMacOS || Platform.isWindows){
//     await windowManager.ensureInitialized();
//     windowManager.waitUntilReadyToShow().then((_) async{
//     // Set to frameless window
//     await windowManager.setAsFrameless();
//     await windowManager.setMinimumSize(Size(1000,Get.height));
//     await windowManager.setSize(const Size(1000, 1000));
//     await windowManager.setPosition(Offset.zero);
//     windowManager.show();
//   });
// }
  DependencyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splash,
      getPages: AppPage.routes,
    );
  }
}


