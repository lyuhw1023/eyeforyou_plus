import 'package:eyeforyou_plus/data/data_service.dart';
import 'package:flutter/material.dart';

class ListProvider extends ChangeNotifier {
  List<Benefit> _benefits = [];

  List<Benefit> get benefits => _benefits;

  Future<void> fetchBenefits(String severity, String category) async {
    try {
      List<Benefit> allBenefits = await loadBenefits();
      _benefits = allBenefits
          .where((benefit) =>
      benefit.severity.contains(severity) &&
          benefit.category.contains(category))
          .toList();
      notifyListeners();
    } catch (e) {
      print("데이터 로드 중 오류 발생: $e");
    }
  }
}
