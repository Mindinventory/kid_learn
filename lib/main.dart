import 'dart:async';
import 'package:flutter/material.dart';
import 'inject/injector.dart';
import 'main_app.dart';
import 'ui/listing/kids_learn_list_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.setup();
  runZoned(() {
    runApp(EntryPoint());
  });
}

class EntryPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MainApp(
      initScreen: KidsLeanListPage(),
    );
  }
}
