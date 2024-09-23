import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thuctap/routes/router_name.dart';
import 'package:thuctap/routes/router_pape.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ticket Manager",
      defaultTransition: Transition.fade,
      initialRoute: RouterName.login,
      getPages: pages,
    );
  }
}
