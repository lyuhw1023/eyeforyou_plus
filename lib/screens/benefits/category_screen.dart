import 'package:eyeforyou_plus/screens/benefits/selection_screen.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:eyeforyou_plus/widgets/option_card.dart';
import 'package:eyeforyou_plus/widgets/selection_modal.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final bool isSevere;

  const CategoryScreen({Key? key, required this.isSevere}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "카테고리 선택",
        onBackPressed: () => Navigator.pop(context),
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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );
  }


}
