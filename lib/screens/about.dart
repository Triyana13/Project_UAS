import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar profil atau foto
            CircleAvatar(
              radius: 50.0,
              backgroundImage: AssetImage('assets/developer_image.jpg'),
            ),
            SizedBox(height: 16.0), // Spasi antara gambar dan deskripsi

            // Deskripsi pengembang
            Text(
              'Triyana Rahmat',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0), // Spasi antara deskripsi

            // Deskripsi informasi pengembang
            Text(
              'Seorang mahasiwa yang berfokus pada IT Security dan vulnerability assessment.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0), // Spasi antara deskripsi

            // Deskripsi minat dan tujuan
            Text(
              'Minat: Penetration Testing,Digital Forensic, SOC ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: About(),
    ),
  );
}
