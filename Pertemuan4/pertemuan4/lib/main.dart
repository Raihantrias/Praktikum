import 'package:flutter/material.dart';
import 'pegawai.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Transfer Variable',
      home: Pegawai(),
    );
  }
}
