import 'package:flutter/material.dart';
import 'router_flutter/login_page.dart';
import 'router_flutter/home_page.dart'; // Pastikan untuk mengimpor halaman home
import 'router_flutter/about_page.dart'; // Pastikan untuk mengimpor halaman about

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Menu',
      initialRoute: '/', // Rute awal
      routes: {
        '/': (context) => const LoginPage(), // Halaman login
        '/home': (context) => const HomePage(), // Halaman home
        '/about': (context) => const AboutPage(), // Halaman about
      },
    );
  }
}
