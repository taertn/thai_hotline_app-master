import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubCHomeUI extends StatelessWidget {
  const SubCHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "ธนาคาร",
      hotlineList: HotlineData.bankHotlines, // ดึงข้อมูลจากหมวดธนาคาร
      bannerImage: "assets/images/sub_c.jpg",
      onInfoPressed: () => Navigator.pushNamed(context, '/about'), 
      themeColor: const Color.fromARGB(255, 30, 30, 30),
    );
  }
}
