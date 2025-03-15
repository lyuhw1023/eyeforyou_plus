import 'package:eyeforyou_plus/data/data_service.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final Benefit benefit;

  const DetailScreen({Key? key, required this.benefit}) : super(key: key);

  void _launchURL(BuildContext context, String url) async {
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("해당 URL을 열 수 없습니다.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF08436D).withOpacity(0.3),
        automaticallyImplyLeading: false,
        title: Text(
          benefit.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        toolbarHeight: 100.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close, semanticLabel: "닫기"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              benefit.description,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 30),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: benefit.content.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ${benefit.content[index]["keyword"]!}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        benefit.content[index]["detail"]!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            ),
            // URL 버튼 추가
            if (benefit.url.isNotEmpty) ...{
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () => _launchURL(context, benefit.url),
                  child: const Text("더 자세히 보러가기"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF08436D),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 20.0),
                  ),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
