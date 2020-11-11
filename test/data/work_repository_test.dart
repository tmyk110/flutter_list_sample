import 'package:flutter_list_sample/data/http_client.dart';
import 'package:flutter_list_sample/data/work_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements HttpClient {}

void main() {
  WorkRepository repository;
  MockHttpClient httpClient;

  setUp(() async {
    httpClient = MockHttpClient();
    repository = WorkRepository(
      httpClient: httpClient,
    );
  });

  test('fetchWorks()', () async {
    // arrange
    final body = '''[
      { "name":"仮設工事", "completed":false },
      { "name":"基礎工事", "completed":true },
      { "name":"木工事", "completed":false }
    ]''';
    when(httpClient.get(any)).thenAnswer((_) => Future.value(body));

    // act
    final works = await repository.fetchWorks();

    // assert
    expect(works.length, 3);
    expect(works[0].name, '仮設工事');
    expect(works[0].completed, false);
    expect(works[1].name, '基礎工事');
    expect(works[1].completed, true);
    expect(works[2].name, '木工事');
    expect(works[2].completed, false);
  });
}
