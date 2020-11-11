import 'package:flutter/material.dart';
import 'package:flutter_list_sample/logic/work_list_model.dart';
import 'package:provider/provider.dart';

class WorkListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<WorkListModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('工事一覧'),
      ),
      body: ListView.builder(
        itemCount: model.items.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(model.items[index]),
        ),
      ),
    );
  }
}
