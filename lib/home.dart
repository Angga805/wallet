import 'package:flutter/material.dart';
import 'kategori_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Data transaksi
  List<Map<String, dynamic>> daftarKegiatan = [
    {
      "kegiatan": "Beli Makan Siang",
      "nominal": 15000,
      "kategori": "Makanan",
    },
    {
      "kegiatan": "Bayar Uang Kas",
      "nominal": 20000,
      "kategori": "Tagihan",
    },
    {
      "kegiatan": "Beli Kuota Internet",
      "nominal": 50000,
      "kategori": "Belanja",
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Keuangan"),
        backgroundColor: Colors.indigo,
      ),

      body: ListView.builder(
        itemCount: daftarKegiatan.length,

        itemBuilder: (context, index) {

          final item = daftarKegiatan[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 5,
            ),

            child: ListTile(

              leading: const CircleAvatar(
                backgroundColor: Colors.indigo,

                child: Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                ),
              ),

              title: Text(item["kegiatan"]),

              subtitle: Text(
                "${item["kategori"]} • Rp ${item["nominal"]}",
              ),

              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),

              onTap: () {
                print("Anda mengklik ${item["kegiatan"]}");
              },
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          // Buka halaman kategori
          final hasilDataTransaksi = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => KategoriScreen(),
            ),
          );

          // Jika ada data baru
          if (hasilDataTransaksi != null) {

            setState(() {
              daftarKegiatan.add(hasilDataTransaksi);
            });

          }
        },

        child: const Icon(Icons.add),
      ),
    );
  }
}