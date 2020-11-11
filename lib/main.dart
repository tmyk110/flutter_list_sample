import 'package:flutter/material.dart';
import 'package:flutter_list_sample/logic/work_list_model.dart';
import 'package:flutter_list_sample/ui/work_list_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xffdd4346),
      ),
      home: ChangeNotifierProvider(
        create: (_) {
          final model = WorkListModel();
          model.fetch();
          return model;
        },
        child: WorkListScreen(),
      ),
    );
  }
}
