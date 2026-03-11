import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubBHomeUI extends StatelessWidget {
  // แก้ตรงนี้ให้เป็น SubB
  const SubBHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "อุบัติเหตุ",
      hotlineList: HotlineData.emergencyHotlines,
      bannerImage: "assets/images/sub_b.jpg",
      onInfoPressed: () => Navigator.pushNamed(context, '/about'), 
      themeColor: const Color.fromARGB(255, 30, 30, 30),
    );
  }
}
