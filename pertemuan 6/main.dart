import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ================= MAIN APP =================
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Wisata',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

// ================= MODEL DATA =================
class TempatWisata {
  final String nama;
  final String lokasi;
  final String gambar;
  final String deskripsi;

  TempatWisata({
    required this.nama,
    required this.lokasi,
    required this.gambar,
    required this.deskripsi,
  });
}

// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  final List<TempatWisata> wisata = [
    TempatWisata(
      nama: "Pantai Dato",
      lokasi: "Majene",
      gambar:
          "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
      deskripsi:
          "Pantai Dato merupakan wisata terkenal di Majene dengan pasir putih dan pemandangan laut yang indah.",
    ),
    TempatWisata(
      nama: "Labuan Bajo",
      lokasi: "NTT",
      gambar:
          "https://images.unsplash.com/photo-1519046904884-53103b34b206",
      deskripsi:
          "Labuan Bajo terkenal dengan keindahan laut, pulau eksotis, dan habitat komodo.",
    ),
    TempatWisata(
      nama: "Bali Beach",
      lokasi: "Bali",
      gambar:
          "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
      deskripsi:
          "Pantai di Bali sangat terkenal hingga mancanegara dengan sunset yang indah.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Wisata"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: wisata.length,
        itemBuilder: (context, index) {
          final data = wisata[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(data: data),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Image.network(
                    data.gambar,
                    width: 100,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.nama,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          data.lokasi,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(height: 5),
                        Text(
                          data.deskripsi,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// ================= DETAIL PAGE =================
class DetailPage extends StatelessWidget {
  final TempatWisata data;

  DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.nama),
      ),
      body: ListView(
        children: [
          Image.network(
            data.gambar,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.nama,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),

                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 5),
                    Text(
                      data.lokasi,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Text(
                  data.deskripsi,
                  style: TextStyle(
                    fontSize: 17,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Kembali"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}