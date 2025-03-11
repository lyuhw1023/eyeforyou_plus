import 'package:eyeforyou_plus/screens/benefits/detail_screen.dart';
import 'package:eyeforyou_plus/widgets/benefit_card.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  final String severity;
  final String category;

  ListScreen({Key? key, required this.severity, required this.category})
      : super(key: key);

  final List<String> benefits = [
    "장애인 콜택시 지원",
    "건강보험",
    "긴급복지",
    "재난적 의료비 지원",
    "장애인 콜택시 지원",
    "건강보험",
    "긴급복지",
    "재난적 의료비 지원",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "$severity & $category",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1,
          ),
          itemCount: benefits.length,
          itemBuilder: (context, index) {
            return BenefitCard(
              title: benefits[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: benefits[index],
                    )
                  )
                );
              },
            );
          },
        ),
      ),
    );
  }
}
