import 'package:flutter/material.dart';

// Model data tanaman hias
class Tanaman {
  final String nama;
  final String jenis;
  final int jumlahDaun;
  final double tinggiCm;
  final bool butuhMatahari;

  const Tanaman({
    required this.nama,
    required this.jenis,
    required this.jumlahDaun,
    required this.tinggiCm,
    required this.butuhMatahari,
  });
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Tanaman Hias',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final Tanaman monstera = const Tanaman(
    nama: 'Monstera Deliciosa',
    jenis: 'Tanaman daun',
    jumlahDaun: 12,
    tinggiCm: 45.5,
    butuhMatahari: false,
  );

  int jumlahSiram = 0;

  void _siramTanaman() {
    setState(() {
      jumlahSiram++;
    });
    // Kode baru untuk memunculkan pesan di Terminal VS Code:
    print("Tanaman berhasil disiram! Total siram: $jumlahSiram kali");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Tanaman Hias'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(60),
                  border: Border.all(color: Colors.teal, width: 3),
                ),
                child: const Icon(Icons.eco, size: 64, color: Colors.teal),
              ),
              const SizedBox(height: 16),
              KartuTanaman(tanaman: monstera),
              const SizedBox(height: 16),
              Text(
                'Sudah disiram $jumlahSiram kali',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: _siramTanaman,
                icon: const Icon(Icons.water_drop),
                label: const Text('Siram Tanaman'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom widget kartu ringkasan tanaman
class KartuTanaman extends StatelessWidget {
  final Tanaman tanaman;

  const KartuTanaman({super.key, required this.tanaman});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tanaman.nama,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(tanaman.jenis),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.grass, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text('Jumlah daun: ${tanaman.jumlahDaun}')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.height, size: 20),
                const SizedBox(width: 8),
                Expanded(child: Text('Tinggi: ${tanaman.tinggiCm} cm')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  tanaman.butuhMatahari ? Icons.wb_sunny : Icons.cloud,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    tanaman.butuhMatahari
                        ? 'Butuh sinar matahari langsung'
                        : 'Cukup cahaya tidak langsung',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}