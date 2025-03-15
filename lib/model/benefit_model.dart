import 'package:eyeforyou_plus/data/data_service.dart';

class BenefitModel {
  List<Benefit> _benefits = [];

  List<Benefit> get benefits => _benefits;

  // 데이터 불러오기
  Future<void> fetchBenefits() async {
    _benefits = await Benefit.loadBenefits();
  }

  // 조건에 맞게 필터링
  List<Benefit> getFilteredBenefits(String severity, String category) {
    final filtered = _benefits.where((benefit) {
      bool severityMatch = benefit.severity.contains(severity.trim());
      bool categoryMatch = benefit.category.contains(category.trim());

      return severityMatch && categoryMatch;
    }).toList();

    return filtered;
  }
}
