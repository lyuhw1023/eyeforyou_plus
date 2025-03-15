import 'package:eyeforyou_plus/viewmodels/list_viewmodel.dart';
import 'package:eyeforyou_plus/viewmodels/selection_viewmodel.dart';
import 'package:eyeforyou_plus/views/benefits/detail_screen.dart';
import 'package:eyeforyou_plus/views/helps/help_list.dart';
import 'package:eyeforyou_plus/widgets/benefit_card.dart';
import 'package:eyeforyou_plus/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    super.initState();
    final selectionviewModel =
        Provider.of<SelectionViewModel>(context, listen: false);
    final listViewModel = Provider.of<ListViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      listViewModel.fetchBenefits(
        selectionviewModel.severity!,
        selectionviewModel.category!,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectionViewModel = Provider.of<SelectionViewModel>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title:
            "${selectionViewModel.severity} & ${selectionViewModel.category}",
        onBackPressed: () => Navigator.pop(context),
        // list 페이지 도움말
        onHelpPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpList()),
          );
        },
      ),
      body: Consumer<ListViewModel>(builder: (context, listViewModel, child) {
        if (listViewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (listViewModel.errorMessage.isNotEmpty) {
          return Center(child: Text(listViewModel.errorMessage));
        } else if (listViewModel.benefits.isEmpty) {
          return const Center(child: Text("해당 조건에 맞는 혜택 정보가 없습니다."));
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: listViewModel.benefits.length,
            itemBuilder: (context, index) {
              return BenefitCard(
                title: listViewModel.benefits[index].title,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(
                        benefit: listViewModel.benefits[index],
                      ),
                    ),
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
