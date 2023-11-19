import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 173, 237),     
        title: Text(
                    'MENU HOME',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images.jpeg',
              width: 400, // Sesuaikan lebar gambar sesuai kebutuhan
              height: 400, // Sesuaikan tinggi gambar sesuai kebutuhan
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16), // Jarak antara gambar dan teks
            Text(
              'THE MOVIE',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}