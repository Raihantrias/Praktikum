import 'package:flutter/material.dart';
import 'konversi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Nilai Mata Kuliah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InputNilaiPage(),
    );
  }
}

class InputNilaiPage extends StatefulWidget {
  @override
  _InputNilaiPageState createState() => _InputNilaiPageState();
}

class _InputNilaiPageState extends State<InputNilaiPage> {
  // Daftar mata kuliah yang sudah ditentukan
  final List<String> matkulNames = [
    'PBO2',
    'Teknologi Multimedia',
    'Analisis dan Desain sistem informasi',
    'Teknik Kompilasi',
    'Interaksi manusia dan komputer',
    'Statistik dan Probalitas',
    'E-commerce',
    'Sistem Operasi',
    'Basis Data',
    'Visual 3',
    'Kecerdasan Buatan',
    'Rekayasa Perangkat Lunak'
  ];

  final List<String> nilaiOptions = ['A', 'B', 'C', 'D', 'E'];
  List<String> selectedNilai = List.filled(12, 'A');

  void hitungNilai() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            HasilPage(selectedNilai: selectedNilai, matkulNames: matkulNames),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input Nilai Mata Kuliah'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: matkulNames.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextField(
                          enabled:
                              false, // Nonaktifkan input untuk nama mata kuliah
                          decoration: InputDecoration(
                            labelText: matkulNames[index],
                          ),
                        ),
                      ),
                      DropdownButton<String>(
                        value: selectedNilai[index],
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedNilai[index] = newValue!;
                          });
                        },
                        items: nilaiOptions
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: hitungNilai,
              child: Text('Hitung Nilai'),
            ),
          ],
        ),
      ),
    );
  }
}
