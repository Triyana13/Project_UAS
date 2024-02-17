import 'package:flutter/material.dart';

class PostScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar 1
            _buildPost(
              image: AssetImage('assets/img/image1.jpg'),
              caption: 'Sekolah yang sangat bagus, ayo main kesini',
            ),
            // Gambar 2
            _buildPost(
              image: AssetImage('assets/img/image2.jpeg'),
              caption: 'Logo STTB',
            ),
            // Gambar 3
            _buildPost(
              image: AssetImage('assets/img/2.jpeg'),
              caption: 'So sad',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPost({
    required ImageProvider<Object> image,
    required String caption,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Teks dari caption
          Container(
            padding: const EdgeInsets.all(4.0),
            color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
            child: Text(
              caption,
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
            
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Teksfield transparent di atas gambar
          Container(
            height: 30.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          // Gambar
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Ikon "Love" dan "Comment"
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Ikon "Love"
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  // Tambahkan logika ketika ikon "Love" diklik
                },
              ),
              // Ikon "Comment"
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  // Tambahkan logika ketika ikon "Comment" diklik
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: PostScreens(),
    ),
  );
}