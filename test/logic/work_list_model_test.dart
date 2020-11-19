import 'package:flutter_list_sample/logic/work_list_model.dart';
import 'package:flutter_list_sample/data/work.dart';
import 'package:flutter_list_sample/data/work_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWorkRepository extends Mock implements WorkRepository {}

void main() {
  WorkListModel model;
  MockWorkRepository repository;

  setUp(() async {
    repository = MockWorkRepository();
    model = WorkListModel(workRepository: repository);
  });

  test('fetch()', () async {
    // arrange
    final works = [
      Work(name: "仮設工事", completed: false),
      Work(name: "基礎工事", completed: true),
      Work(name: "木工事", completed: false),
      Work(name: "左官工事", completed: false),
      Work(name: "内装工事", completed: false),
    ];
    when(repository.fetchWorks()).thenAnswer((_) => Future.value(works));

    // act
    await model.fetch();

    // assert
    expect(model.items.length, 1);
    expect(model.items[0], '基礎工事');
  });
}
