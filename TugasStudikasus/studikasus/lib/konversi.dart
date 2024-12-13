import 'package:flutter/material.dart';

class HasilPage extends StatelessWidget {
  final List<String> selectedNilai;
  final List<String> matkulNames;

  HasilPage({required this.selectedNilai, required this.matkulNames});

  double hitungIPK() {
    int totalSKS = 0;
    double totalNilai = 0.0;

    for (String nilai in selectedNilai) {
      int sks = 3; // Misalkan setiap mata kuliah memiliki 3 SKS
      totalSKS += sks;

      switch (nilai) {
        case 'A':
          totalNilai += 4.0 * sks;
          break;
        case 'B':
          totalNilai += 3.0 * sks;
          break;
        case 'C':
          totalNilai += 2.0 * sks;
          break;
        case 'D':
          totalNilai += 1.0 * sks;
          break;
        case 'E':
          totalNilai += 0.0 * sks;
          break;
      }
    }

    return totalSKS > 0 ? totalNilai / totalSKS : 0.0;
  }

  String indeksPrestasiSemester(double nilai) {
    if (nilai >= 0 && nilai <= 2.5) {
      return 'Tidak Memuaskan';
    } else if (nilai >= 2.6 && nilai < 3.0) {
      return 'Memuaskan';
    } else if (nilai >= 3.1 && nilai <= 3.5) {
      return 'Sangat Memuaskan';
    } else {
      return 'Dengan Pujian';
    }
  }

  @override
  Widget build(BuildContext context) {
    double ipk = hitungIPK();
    String prestasi = indeksPrestasiSemester(ipk);

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil IPK'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'IPK Anda: ${ipk.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Indeks Prestasi Semester: $prestasi',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'Detail Mata Kuliah dan Nilai:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: matkulNames.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(matkulNames[index]),
                    trailing: Text(selectedNilai[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
