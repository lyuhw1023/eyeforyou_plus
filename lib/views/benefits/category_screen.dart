import 'package:eyeforyou_plus/viewmodels/selection_viewmodel.dart';
import 'package:eyeforyou_plus/views/benefits/list_screen.dart';
import 'package:eyeforyou_plus/views/helps/help_category.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:eyeforyou_plus/widgets/option_card.dart';
import 'package:eyeforyou_plus/widgets/selection_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectionProvider>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: "카테고리 선택",
        onBackPressed: () => Navigator.pop(context),
        // category 페이지 도움말
        onHelpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpCategory()),
          );
        },
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionCard(
              icon: Icons.autorenew,
              text: "생애주기",
              onTap: () {
                SelectionModal.show(
                  context: context,
                  categoryType: "생애주기",
                  onItemSelected: (selectedItem) {
                    provider.setCategory(selectedItem);
                    _navigateToListScreen(context, selectedItem);
                  },
                );
              },
            ),
            SizedBox(width: 30),
            OptionCard(
              icon: Icons.health_and_safety_outlined,
              text: "복지서비스",
              onTap: () {
                SelectionModal.show(
                  context: context,
                  categoryType: "복지서비스",
                  onItemSelected: (selectedItem) {
                    provider.setCategory(selectedItem);
                    _navigateToListScreen(context, selectedItem);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToListScreen(BuildContext context, String category) {
    final provider = Provider.of<SelectionProvider>(context, listen: false);
    print("${provider.severity}, ${provider.category}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ListScreen()),
    );
  }


}
