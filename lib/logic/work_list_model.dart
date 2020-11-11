import 'package:flutter/material.dart';
import 'package:flutter_list_sample/data/work_repository.dart';

class WorkListModel with ChangeNotifier {
  WorkListModel({
    WorkRepository workRepository,
  }) : this._workRepository = workRepository ?? WorkRepository();

  List<String> get items => _items;

  final WorkRepository _workRepository;
  List<String> _items = [];

  Future fetch() async {
    final works = await _workRepository.fetchWorks();
    _items = works.where((e) => e.completed).map((e) => e.name).toList();
    notifyListeners();
  }
}
