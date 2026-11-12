import 'package:flutter/material.dart';
import 'presentation/dashboard.dart';
import 'presentation/doa_screen.dart';
import 'presentation/zakat.dart';
import 'presentation/jadwal_sholat.dart';
import 'presentation/video_kajian.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // home: const ScreenDashboard(),
      routes: {
        "/": (context) => const ScreenDashboard(),
        "/doa-doa": (context) => const DoaDoaPage(),
        "/zakat": (context) => const ZakatPage(),
        "/jadwal-sholat": (context) => const JadwalSholatPage(),
        "/video-kajian": (context) => const VideoKajianPage(),
      },
    );
  }
}

