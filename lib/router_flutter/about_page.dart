import 'package:flutter/material.dart';
import 'package:afnan/router_flutter/side_menu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang MebelKu'),
        backgroundColor: Colors.blueGrey[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Bagian Header dengan Gambar Ilustratif
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('mabel_banner.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang di MebelKu!',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Furniture Berkualitas untuk Hunian Elegan Anda',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bagian Deskripsi
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Tentang MebelKu',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'MebelKu adalah perusahaan furniture yang berdedikasi untuk menciptakan ruang tinggal yang nyaman, mewah, dan berkelas. Kami menggabungkan keahlian tangan profesional dengan bahan berkualitas tinggi untuk menghadirkan keindahan pada setiap produk yang kami buat.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Kami percaya bahwa furniture bukan hanya barang fungsional, tetapi juga bagian penting dari cerita rumah Anda. Dengan desain yang timeless dan kualitas yang tak tertandingi, MebelKu siap membantu Anda mewujudkan hunian impian.',
                    style: TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),

                  // Fitur Utama
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FeatureCard(
                        icon: Icons.star,
                        title: 'Kualitas Premium',
                        description: 'Hanya bahan terbaik dengan pengerjaan tangan profesional.',
                      ),
                      FeatureCard(
                        icon: Icons.design_services,
                        title: 'Desain Unik',
                        description: 'Setiap produk kami didesain untuk menyatu dengan gaya hidup Anda.',
                      ),
                      FeatureCard(
                        icon: Icons.handshake,
                        title: 'Layanan Terbaik',
                        description: 'Kepuasan pelanggan adalah prioritas utama kami.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}

// Widget custom untuk menampilkan fitur
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.brown[100],
          child: Icon(icon, size: 30, color: Colors.brown[700]),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.brown[800],
          ),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
