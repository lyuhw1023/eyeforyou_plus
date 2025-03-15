import 'package:eyeforyou_plus/data/data_service.dart';
import 'package:eyeforyou_plus/model/benefit_model.dart';
import 'package:flutter/material.dart';

class ListViewModel extends ChangeNotifier {
  final BenefitModel _benefitModel = BenefitModel();
  List<Benefit> _benefits = [];

  bool _isLoading = false;
  String _errorMessage = "";

  List<Benefit> get benefits => _benefits;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchBenefits(String severity, String category) async {
    _isLoading = true;
    _errorMessage = "";
    notifyListeners();

    try{
      await _benefitModel.fetchBenefits();
      // Model에서 데이터 가져오기
      _benefits = _benefitModel.getFilteredBenefits(severity, category);
      if (_benefits.isEmpty) {
        _errorMessage = "해당 조건에 맞는 혜택 정보가 없습니다.";
      }
    } catch (e) {
      _errorMessage = "데이터를 불러오는 중 오류가 발생했습니다. %e";
    }

    _isLoading = false;
    notifyListeners();
  }
}
