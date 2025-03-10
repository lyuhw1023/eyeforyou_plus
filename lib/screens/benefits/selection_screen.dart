import 'package:eyeforyou_plus/screens/benefits/category_screen.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:eyeforyou_plus/widgets/option_card.dart';
import 'package:flutter/material.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "중증/경증 선택",
        onBackPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionCard(
              icon: Icons.lightbulb_outline,
              text: '중증\n(1급 ~ 3급)',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(isSevere: true),
                  ),
                );
              },
            ),
            SizedBox(width: 30),
            OptionCard(
              icon: Icons.highlight_outlined,
              text: '경증\n(4급 ~ 6급)',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(isSevere: false),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionButton(
      BuildContext context, String label, bool isServere) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(isSevere: isServere),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text(label),
    );
  }
}
