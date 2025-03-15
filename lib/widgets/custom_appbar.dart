import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title; // 화면 제목
  final VoidCallback? onBackPressed; // 뒤로가기 버튼
  final VoidCallback? onHelpPressed; // 도움말 버튼
  final VoidCallback? onLeftButtonPressed; // 왼쪽 버튼 - 혜택 페이지

  const CustomAppBar({
    super.key,
    this.title,
    this.onBackPressed,
    this.onHelpPressed,
    this.onLeftButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // 제목 중앙 정렬
      // null이면 로고 표시
      centerTitle: true,
      leading: onBackPressed != null
          ? Semantics(
              label: "뒤로 가기 버튼",
              excludeSemantics: true,
              child: IconButton(
                // 뒤로가기 버튼
                icon: const Icon(Icons.arrow_back),
                onPressed: onBackPressed,
              ),
            )
          : (onLeftButtonPressed != null
              ? Semantics(
                  label: "혜택 정보 보러가기",
                  excludeSemantics: true,
                  child: IconButton(
                    // 혜택 페이지 버튼
                    icon: const Icon(Icons.more_horiz),
                    onPressed: onLeftButtonPressed,
                  ),
                )
              : null),
      title: title != null
          ? Text(title!,
              // 화면 제목 표시
              style: const TextStyle(fontWeight: FontWeight.bold))
          // 로고 이미지 표시
          : Image.asset('assets/images/logo.png', height: 130),
      actions: [
        // 도움말 버튼
        if (onHelpPressed != null)
          Semantics(
            label: "도움말 버튼",
            excludeSemantics: true,
            child: IconButton(
              icon: const Icon(Icons.question_mark_rounded),
              onPressed: onHelpPressed,
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
