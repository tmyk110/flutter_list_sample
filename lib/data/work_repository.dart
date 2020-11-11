import 'dart:convert';

import 'package:flutter_list_sample/data/http_client.dart';
import 'package:flutter_list_sample/data/work.dart';

class WorkRepository {
  WorkRepository({
    HttpClient httpClient,
  }) : this._httpClient = httpClient ?? HttpClient();

  HttpClient _httpClient;

  Future<List<Work>> fetchWorks() async {
    const url = 'https://my-json-server.typicode.com/tmyk110/api/works';
    try {
      final responseBody = await _httpClient.get(url);
      List list = json.decode(responseBody);
      final works = list
          .map((obj) => Work(
                name: obj['name'],
                completed: obj['completed'],
              ))
          .toList();
      return Future.value(works);
    } catch (error) {
      throw error;
    }
  }
}
