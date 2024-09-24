import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/router_flutter/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;

  // Simulasi data produk untuk tampilan grid
  final List<Map<String, String>> products = [
    {"name": "Chair", "image": "chair.jpg", "price": "\$120"},
    {"name": "Sofa", "image": "sofa.jpg", "price": "\$300"},
    {"name": "Table", "image": "table.jpg", "price": "\$150"},
    {"name": "Lamp", "image": "lamp.jpg", "price": "\$80"},
    {"name": "Shelf", "image": "shelf.jpg", "price": "\$200"},
  ];

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mebelku'),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: const Icon(Icons.person, color: Colors.black),
            ),
          ),
        ],
      ),
      drawer: const Sidemenu(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),

            // Header "Featured Products"
            const Text(
              'Featured Products',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // GridView untuk menampilkan produk
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Tetap 2 kolom
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1, // Aspect ratio lebih besar untuk membuat kartu lebih kecil
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Fungsi untuk detail produk
                    },
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Sudut kartu sedikit lebih kecil
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Gambar Produk dengan tinggi lebih kecil
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            child: Container(
                              height: 120, // Tinggi gambar dikurangi agar kartu lebih kecil
                              width: double.infinity, // Lebar penuh
                              child: Image.asset(
                                products[index]["image"]!,
                                fit: BoxFit.cover, // Gambar tetap memenuhi container
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 4.0), // Padding lebih kecil
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Nama Produk
                                Text(
                                  products[index]["name"]!,
                                  style: const TextStyle(
                                    fontSize: 14, // Ukuran font lebih kecil
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 5),
                                // Harga Produk
                                Text(
                                  products[index]["price"]!,
                                  style: const TextStyle(
                                    fontSize: 12, // Ukuran font lebih kecil
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 4),
                                // Tombol Add to Cart
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueGrey[800],
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6), // Padding lebih kecil
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15), // Ukuran tombol lebih kecil
                                    ),
                                  ),
                                  onPressed: () {
                                    // Fungsi untuk menambahkan ke keranjang
                                  },
                                  icon: const Icon(Icons.add_shopping_cart, size: 16), // Ikon lebih kecil
                                  label: const Text('Add to Cart', style: TextStyle(fontSize: 10)), // Label lebih kecil
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
