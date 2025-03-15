import 'package:eyeforyou_plus/viewmodels/selection_viewmodel.dart';
import 'package:eyeforyou_plus/views/benefits/category_screen.dart';
import 'package:eyeforyou_plus/views/helps/help_selection.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:eyeforyou_plus/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SelectionProvider>(context, listen: false);

    return Scaffold(
      appBar: CustomAppBar(
        title: "중증/경증 선택",
        onBackPressed: () => Navigator.pop(context),
        // selection 페이지 도움말
        onHelpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpSelection()),
          );
        },
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OptionCard(
              icon: Icons.lightbulb_outline,
              text: '중증\n(1급 ~ 3급)',
              onTap: () {
                provider.setSeverity("중증");
                print("severity : ${provider.severity}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryScreen(),
                  ),
                );
              },
            ),
            SizedBox(width: 30),
            OptionCard(
              icon: Icons.highlight_outlined,
              text: '경증\n(4급 ~ 6급)',
              onTap: () {
                provider.setSeverity("경증");
                print("severity : ${provider.severity}");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoryScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _buildSelectionButton(
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
  }*/
}
