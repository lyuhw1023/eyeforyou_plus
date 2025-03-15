import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Benefit {
  final String title;
  final String description;
  final List<String> severity;
  final List<String> category;
  final List<Map<String, String>> content;
  final String url;

  Benefit({
    required this.title,
    required this.description,
    required this.severity,
    required this.category,
    required this.content,
    required this.url,
  });

  // json 데이터를 객체로 변환
  factory Benefit.fromJson(Map<String, dynamic> json){
    return Benefit(
      title: json["title"],
      description: json["description"],
      severity: List<String>.from(json["severity"]),
      category: List<String>.from(json["category"]),
      content: List<Map<String, String>>.from(json["content"].map((item) =>
      {
        "keyword": item["keyword"] as String,
        "detail": item["detail"].toString(),
      })),
      url: json["url"],
    );
  }

  // json 파일 불러오기
  static Future<List<Benefit>> loadBenefits() async {
    try {
      final String response =
      await rootBundle.loadString("assets/crawling_result_final.json");
      final List<dynamic> data = json.decode(response);

      List<Benefit> benefits = data.map((json) => Benefit.fromJson(json)).toList();

      return benefits;
    } catch (e) {
      print("데이터 로드 중 오류 발생: $e");
      return [];
    }
  }

}