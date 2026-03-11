import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui'; // อย่าลืม import package นี้เพื่อใช้ ImageFilter

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  final Color myBackgroundColorCenter =
      const Color.fromARGB(255, 34, 50, 73); // สีพื้นหลังเข้มตรงกลาง
  final Color myBackgroundColorEdge =
      const Color.fromARGB(255, 59, 90, 148); // สีพื้นหลังโทนเดิมที่ขอบ
  final Color myTextColorMain =
      const Color.fromARGB(255, 255, 255, 255); // สีข้อความหลัก (เช่น หัวข้อ)
  final Color myTextColorSub =
      const Color.fromARGB(255, 210, 215, 219); // สีข้อความรอง (เช่น ข้อมูล)
  final Color myAccentColor =
      const Color.fromARGB(255, 142, 167, 248); // สีเน้น (เช่น ขอบรูปโปรไฟล์, ข้อมูลบางส่วน)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  myBackgroundColorCenter, // เข้มตรงกลาง
                  myBackgroundColorEdge, // โทนเดิมที่ขอบ
                ],
                stops: const [0.3, 1.0],
              ),
            ),
          ),

          // --- 2. เนื้อหาหลัก ---
          Scaffold(
            backgroundColor: Colors
                .transparent, // ทำให้ Scaffold โปร่งใสเพื่อเห็นพื้นหลัง Stack
            appBar: AppBar(
              backgroundColor: Colors.transparent, // AppBar โปร่งใส
              elevation: 0,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new, color: myTextColorSub),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'สายด่วน THAILAND',
                style: GoogleFonts.inter(
                  color: myTextColorMain, // ปรับสีตัวอักษรให้เข้ากับโทนสีใหม่
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 18,
                ),
              ),
            ),
            body: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),

                      Text(
                        'ผู้จัดทำ',
                        style: GoogleFonts.kanit(
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 2.5,
                          color: Colors
                              .white, // ปรับเป็นสีขาวเพื่อให้เด่นบนพื้นหลังเข้ม
                        ),
                      ),
                      const SizedBox(height: 28),

                      /// โลโก้มหาวิทยาลัย (เรียบง่ายและกลมกลืน)
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white
                              .withValues(alpha: 0.5), // สีขาวโปร่งแสงจางๆ
                          borderRadius: BorderRadius.circular(40),
                          border: Border.all(
                              color: myTextColorSub.withValues(alpha: 0.1),
                              width: 1.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            'assets/images/Logosau.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) => Icon(
                                Icons.business_rounded,
                                size: 50,
                                color: myTextColorSub.withValues(alpha: 0.3)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),
                      Text(
                        'มหาวิทยาลัยเอเชียอาคเนย์',
                        style: GoogleFonts.kanit(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 202, 212, 226)
                              .withValues(alpha: 0.7), // ใช้สีเทาอ่อนจางๆ
                        ),
                      ),
                      const SizedBox(height: 30),

                      /// --- รูปโปรไฟล์ กระจกใส (Frosted Glass Effect) ---
                      Container(
                        width: 140, // ปรับขนาดเล็กน้อย
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white.withValues(alpha: 0.1), width: 1.0),
                        ),
                        child: ClipOval(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 5.0,
                                sigmaY: 5.0), // สร้างเอฟเฟกต์กระจกฝ้า
                            child: Container(
                              color: Colors.white
                                  .withValues(alpha: 0.05), // สีขาวโปร่งแสงจางๆ
                              child: Padding(
                                padding: const EdgeInsets.all(
                                    6.0), // Padding เพื่อให้รูปภาพมีระยะห่างจากขอบ
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: myAccentColor, width: 2.5),
                                  ),
                                  child: const CircleAvatar(
                                    radius: 71, // ปรับรัศมี
                                    backgroundColor: Colors.white10,
                                    backgroundImage:
                                        AssetImage('assets/icon/profile.jpg'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      /// --- ข้อมูลนักศึกษา พร้อมเล่นสี ---
                      _buildSimpleInfo('รหัสนักศึกษา', '6519410047',
                          myAccentColor), // ใช้สีเน้น
                      _buildSimpleInfo('ชื่อ-สกุลนักศึกษา',
                          'นาย รัตนะ พัฒนตระกูลเอก', const Color.fromARGB(255, 151, 184, 255)),
                      _buildSimpleInfo('อีเมล์นักศึกษา',
                          's6519410047@sau.ac.th', const Color.fromARGB(255, 151, 184, 255)),
                      _buildSimpleInfo('ชื่อสาขาวิชา', 'วิศวกรรมคอมพิวเตอร์',
                          myAccentColor), // ใช้สีเน้น
                      _buildSimpleInfo('ชื่อคณะ', 'คณะวิศวกรรมศาสตร์',
                          myAccentColor), // ใช้สีเน้น

                      const SizedBox(height: 72),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ฟังก์ชันสร้างข้อมูล (ปรับสไตล์ข้อความ)
  Widget _buildSimpleInfo(String label, String value, Color valueColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 255, 255, 255).withValues(alpha: 0.7), // ใช้สีขาวจางๆ
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: valueColor, // ใช้สีตามที่กำหนดใน parameter
            ),
          ),
        ],
      ),
    );
  }
}
