// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
// import 'package:logger/logger.dart';

import 'package:flutter_application_1/_core/app_bar.dart';
import 'package:flutter_application_1/screen_ui.dart';
import 'package:flutter_application_1/app_get.dart';
import 'package:flutter_application_1/_core/app_theme.dart';
import 'package:flutter_application_1/initial_app.dart';

// Logger logger = Logger();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Provider.debugCheckInvalidValueType = null;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.white), //AppTheme.lightTheme,
        darkTheme: ThemeData.dark(),
        home: const InitialApp(),
        routes: {});
  }
}

class HelloFlutter extends StatelessWidget {
  const HelloFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ListApp());
    ListApp _controller = Get.find<ListApp>();
    return Scaffold(
        appBar: appBar(title: 'Count App With Get X(Reactive)'),
        body: Obx(
          () => screenUI(
            context: context,
            count: _controller.rxCount.value,
            selectCount: _controller.rxSelectCount.value,
            onIncrement: () {
              HapticFeedback.mediumImpact();
              _controller.increment();
            },
            onDecrement: () {
              HapticFeedback.mediumImpact();
              _controller.decrement();
            },
            onReset: () {
              HapticFeedback.mediumImpact();
              _controller.reset();
            },
            onCount: (int number) {
              HapticFeedback.mediumImpact();
              _controller.changedCount(number);
            },
          ),
        ));
  }
}
