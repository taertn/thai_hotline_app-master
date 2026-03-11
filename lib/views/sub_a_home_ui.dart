import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubAHomeUI extends StatelessWidget {
  const SubAHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "การเดินทาง",
      hotlineList: HotlineData.travelHotlines, // ตัวอย่างสีเขียวเข้มแบบการเดินทาง
      bannerImage: "assets/images/sub_a.jpg",
      onInfoPressed: () => Navigator.pushNamed(context, '/about'), 
      themeColor: const Color.fromARGB(255, 30, 30, 30),
    );
  }
}
