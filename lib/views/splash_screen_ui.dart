import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'introduction_call_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const IntroductionCallUI(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    /// --- โทนสีใหม่สำหรับการเล่นเงาพื้นหลัง ---
    // ignore: unused_local_variable
    const Color myBackgroundColorCenter =   Color.fromARGB(255, 182, 188, 199);
    const Color myBackgroundColorEdge =
          Color.fromARGB(255, 34, 50, 73); 

    const Color myMainTextColor = Color.fromARGB(255, 255, 255, 255); // สีตัวอักษรหลัก
    const Color mySubTextColor = Color.fromARGB(255, 249, 244, 253); // สีตัวอักษรรอง
    // ignore: unused_local_variable
    const Color myLoadingColor = Color.fromARGB(255, 255, 255, 255);
// สี Loading

    /// ขนาดโลโก้
    double customLogoSize = 250.0;

    return Scaffold(
      // นำ backgroundColor ออกเพื่อใช้ Container ด้านล่างทำ Gradient แทน
      body: Container(
        width: double.infinity,
        height: double.infinity,

        /// --- การตั้งค่าพื้นหลัง Radial Gradient ---
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center, // เริ่มไล่สีจากกลางจอ
            radius: 1.0, // รัศมีการกระจายสี
            colors: [
              Color.fromARGB(255, 39, 69, 97), // สีสว่างตรงกลาง
              myBackgroundColorEdge, // สีเข้มที่ขอบ
            ],
            stops: [
              0.2,
              1.0
            ], // กำหนดจังหวะการเปลี่ยนสี (0.2 คือให้สีกลางคงที่สักพักแล้วค่อยไล่ไป 1.0)
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// --- โลโก้ พร้อมเอฟเฟกต์เงา ---
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    // สีเงา (ใช้สีดำจางๆ เพื่อความนุ่มนวล)
                    color: Colors.black.withValues(
                        alpha: 0.4), // เพิ่มความเข้มเงาเล็กน้อยเพื่อให้รับกับพื้นหลังใหม่
                    // ระดับความฟุ้งของเงา
                    blurRadius: 40, // เพิ่มความฟุ้ง
                    // ระดับการกระจายของเงา
                    spreadRadius: 2,
                    // ตำแหน่งของเงา (x, y)
                    offset: const Offset(0, 15), // ขยับเงาลงมาอีกนิด
                  ),
                ],
              ),
              child: Image.asset(
                'assets/icon/splash_screen.png',
                width: customLogoSize,
                height: customLogoSize,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.contact_phone_rounded,
                  size: customLogoSize * 0.5,
                  color: const Color(0xFFF8FAFC),
                ),
              ),
            ),

            const SizedBox(height: 56), // เพิ่มระยะห่างเล็กน้อย

            /// --- Title พร้อมเงาหลังตัวอักษร ---
            Text(
              'THAI HOTLINE',
              style: GoogleFonts.inter(
                fontSize: 36, // ปรับขนาดใหญ่ขึ้นเล็กน้อย
                fontWeight: FontWeight.w800, // เพิ่มความหนา
                letterSpacing: 2.5,
                color: myMainTextColor,
                // ใส่เงาให้ตัวอักษรดูมีมิติ
                shadows: [
                  Shadow(
                    color: Colors.black
                        .withValues(alpha: 0.5), // เพิ่มความเข้มเงาตัวอักษร
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// --- Subtitle ---
            Text(
              'สายด่วนไทย อุ่นใจทุกการเชื่อมต่อ',
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.0,
                color: mySubTextColor,
                // ใส่เงาบางๆ ให้สอดคล้องกัน
                shadows: [
                  Shadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 72), // เพิ่มระยะห่าง

            /// --- Loading ---
            const SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 34, 50, 73)), // ใช้สีเดียวกับตัวอักษรหลักเพื่อความสอดคล้อง
              ),
            ),
          ],
        ),
      ),
    );
  }
}
