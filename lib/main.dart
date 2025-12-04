import 'package:currency_app/controller/controller_state.dart';
import 'package:currency_app/screens/home_page.dart';
import 'package:currency_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
    WidgetsFlutterBinding.ensureInitialized();

  Get.put(ControllerState(),permanent: true);
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: TheTheme.themedata,
      debugShowCheckedModeBanner: false,
     home: HomePage(),
    );
  }
}

