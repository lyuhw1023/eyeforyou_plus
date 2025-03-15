import 'package:eyeforyou_plus/viewmodels/list_viewmodel.dart';
import 'package:eyeforyou_plus/viewmodels/selection_viewmodel.dart';
import 'package:eyeforyou_plus/views/benefits/detail_screen.dart';
import 'package:eyeforyou_plus/views/helps/help_list.dart';
import 'package:eyeforyou_plus/widgets/benefit_card.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectionProvider = Provider.of<SelectionProvider>(context);
    final listProvider = Provider.of<ListProvider>(context);

    // 데이터 불러오기
    listProvider.fetchBenefits(
        selectionProvider.severity!, selectionProvider.category!);

    return Scaffold(
      appBar: CustomAppBar(
        title: "${selectionProvider.severity} & ${selectionProvider.category}",
        onBackPressed: () => Navigator.pop(context),
        // list 페이지 도움말
        onHelpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpList()),
          );
        },
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
          itemCount: listProvider.benefits.length,
          itemBuilder: (context, index) {
            return BenefitCard(
              title: listProvider.benefits[index].title,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              benefit: listProvider.benefits[index],
                            )));
              },
            );
          },
        ),
      ),
    );
  }
}
