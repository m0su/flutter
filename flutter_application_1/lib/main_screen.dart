import 'package:flutter/material.dart';
import 'package:flutter_application_1/_core/app_size.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    // return Consumer<MainProvider>(builder: (context, state, child) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello Flutter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text("안녕1"),
              Text("안녕2"),
              TextButton(
                onPressed: () => Get.defaultDialog(
                    // 기본 대화창 생성
                    title: 'Dialog', // 대화창 title
                    middleText: 'Dialog' // 대화창 Description
                    ),
                child: const Text('Get.defaultDialog()'),
              ),
            ],
          ),
        ),
      ),
    );
    // });
  }
}
