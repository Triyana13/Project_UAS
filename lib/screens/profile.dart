import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Gambar profil bulat
          CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage('assets/profile_image.jpg'),
          ),
          SizedBox(height: 16.0), // Spasi antara gambar dan teksfield

          // TextField untuk username
          TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0), // Spasi antara teksfield

          // TextField untuk email
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0), // Spasi antara teksfield

          // TextField lainnya...
          // ...

          // Tombol Simpan
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika simpan profil di sini
            },
            child: Text('Simpan'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Profile(),
    ),
  );
}
