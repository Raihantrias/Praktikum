import 'package:flutter/material.dart';

class Image02 extends StatelessWidget {
  const Image02({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        // Agar konten dapat digulir
        child: Column(
          children: [
            Image.asset('assets/Gambar1.jpg'), // Gambar 1
            Image.asset('assets/Gambar2.jpg'), // Gambar 2
            Image.asset('assets/Gambar3.jpg'), // Gambar 3
            Image.asset('assets/Gambar4.jpg'), // Gambar 4
            Image.asset('assets/Gambar5.jpg'), // Gambar 5
          ],
        ),
      ),
    );
  }
}
