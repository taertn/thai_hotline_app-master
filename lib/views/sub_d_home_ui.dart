import 'package:flutter/material.dart';
import 'sub_template_ui.dart';
import '../data/thai_hotline.dart';

class SubDHomeUI extends StatelessWidget {
  const SubDHomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return SubHomeUI(
      categoryTitle: "สาธารณูปโภค",
      hotlineList: HotlineData.utilityHotlines, // ดึงข้อมูลจากหมวดสาธารณูปโภค
      bannerImage: "assets/images/sub_d.jpg",
      onInfoPressed: () => Navigator.pushNamed(context, '/about'), 
      themeColor: const Color.fromARGB(255, 30, 30, 30),
    );
  }
}
