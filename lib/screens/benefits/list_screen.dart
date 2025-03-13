import 'package:eyeforyou_plus/screens/benefits/detail_screen.dart';
import 'package:eyeforyou_plus/widgets/benefit_card.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:eyeforyou_plus/data/data_service.dart';

class ListScreen extends StatefulWidget {
  final String severity;
  final String category;

  const ListScreen({Key? key, required this.severity, required this.category})
      : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Benefit>> benefitsFuture;

  @override
  void initState() {
    super.initState();
    benefitsFuture = loadBenefits();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "${widget.severity} & ${widget.category}",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: FutureBuilder<List<Benefit>>(
          future: benefitsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print("데이터 불러오기 오류: ${snapshot.error}");
              return const Center(child: Text("데이터를 불러오는 중 오류가 발생했습니다."));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("해당 조건에 맞는 혜택 정보가 없습니다."));
            }

            // 조건에 맞는 데이터 가져오기
            final benefits = snapshot.data!
                .where((benefit) =>
                    benefit.severity.contains(widget.severity) &&
                    benefit.category.contains(widget.category))
                .toList();

            return Padding(
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
                    title: benefits[index].title,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                benefit: benefits[index],
                              )
                          )
                      );
                    },
                  );
                },
              ),
            );
          }),
    );
  }
}
