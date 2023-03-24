import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/service/bind_service.dart';
import 'package:getx_example/view/home_page/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      initialBinding: BindService(),
      getPages: [
        GetPage(
          name: '/HomePage',
          page: () => const HomePage(),
          binding: BindService(),
        ),
      ],
    );
  }
}
