import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pingo/model/workplace.dart';

final workplaceProvider =
    ChangeNotifierProvider<WorkplaceProvider>((ref) => WorkplaceProvider());

class WorkplaceProvider extends ChangeNotifier {
  final List<Workplace> _workplaces = [
    Workplace(
      id: 1,
      name: 'Workplace 1',
      location: 'Location 1',
    ),
  ];
  List<Workplace> get workplaces => _workplaces;
  int get workplacesCount => _workplaces.length;

  void addWorkplace(Workplace workplace) {
    _workplaces.add(workplace);
    notifyListeners();
  }

  void removeWorkplace(index) {
    _workplaces.removeAt(index);
    notifyListeners();
  }
}
