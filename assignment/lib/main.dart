import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'views/first_view.dart';
import 'model/model.dart';

void main() {
  var state = MyState();
  runApp(ChangeNotifierProvider(create: (context) => state, child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
