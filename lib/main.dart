import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_example/service/bind_service.dart';
import 'package:getx_example/service/di_service.dart';
import 'package:getx_example/view/home_page/home_view.dart';
import 'package:getx_example/view/splash/splash_page.dart';

void main() async{
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      // initialBinding: BindService(),
      // getPages: [
      //   GetPage(
      //     name: '/HomePage',
      //     page: () => const HomePage(),
      //     binding: BindService(),
      //   ),
      // ],
    );
  }
}
