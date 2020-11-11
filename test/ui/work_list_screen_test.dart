import 'package:flutter/material.dart';
import 'package:flutter_list_sample/logic/work_list_model.dart';
import 'package:flutter_list_sample/ui/work_list_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockWorkListModel extends Mock implements WorkListModel {}

class ModelContainer with ChangeNotifier {
  final WorkListModel model;

  ModelContainer({@required this.model});

  static Widget builder(BuildContext context, Widget child) {
    return ChangeNotifierProvider<WorkListModel>.value(
      value: context.watch<ModelContainer>().model,
      child: child,
    );
  }
}

void main() {
  MaterialApp app;
  MockWorkListModel model;

  setUp(() async {
    model = MockWorkListModel();

    app = MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => ModelContainer(model: model),
        builder: ModelContainer.builder,
        child: WorkListScreen(),
      ),
    );
  });

  testWidgets('WorkListScreen', (WidgetTester tester) async {
    // arrange
    when(model.items).thenAnswer((_) => ['基礎工事']);

    // act
    await tester.pumpWidget(app);

    // assert
    expect(find.text('工事一覧'), findsOneWidget);
    expect(find.text('基礎工事'), findsOneWidget);

    // dump
    debugDumpApp();
  });
}
