import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // List gambar dari URL
  final List<String> imageUrls = [
    'https://storage.googleapis.com/finansialku_media/wordpress_media/2022/11/5bd1c4bd-black-adam.-sumber-imdb-1.jpg',
    'https://storage.googleapis.com/finansialku_media/wordpress_media/2022/11/d40eb205-ambulance.-sumber-imdb-1.jpg',
    'https://storage.googleapis.com/finansialku_media/wordpress_media/2022/11/3187b9c4-top-gun-maverick.-sumber-imdb-1.jpg',
    'https://storage.googleapis.com/finansialku_media/wordpress_media/2022/11/2c7a98ae-everything-everywhere-all-at-once.-sumber-imdb-1.jpg',
    'https://storage.googleapis.com/finansialku_media/wordpress_media/2022/11/2875b0f5-uncharted.-sumber-imdb-1.jpg',
    'https://storage.googleapis.com/finansialku_media/wordpress_media/2022/11/a04b7fda-black-widow.-sumber-imdb-1.jpg'
    
  ];

  // List Nama pada gambar
  final List<String> itemNames = [
    'TBLACK ADAM',
    'AMBULANCE',
    'ALL QUIET ON THE WESTERN FONT',
    'EVERYTHING EVERYWHERE ALL AT ONCE',
    'UNCHARTED',
    'BLACK WIDOW'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 213, 235),
        title: Text(
          'MOVIE HOME',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'FAVORIT MOVIE',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, 
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 6, // nomber pada item grid 
              itemBuilder: (context, index) {
               
                String imageUrl = imageUrls[index % imageUrls.length];
                String itemName = itemNames[index % itemNames.length];

                return Card(
                  color: Color.fromARGB(255, 255, 204, 242),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        10.0), // pading yang dibutuhkan 
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              imageUrl,
                              width: 120.0, // lebar yang dibutuhkan
                              height: 120.0, // tinggi yang dibutuhkan
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(itemName),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}