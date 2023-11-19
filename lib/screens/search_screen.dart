import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> imageUrls = [
    'https://fokusjabar.id/wp-content/uploads/2023/02/Titanic-Remastered-485x360.webp',
    'https://cinemags.org/wp-content/uploads/2021/11/Sing-2.jpg',
    'https://thelazy.media/wp-content/uploads/2018/07/DiPlv_DX4AAnuvt.jpg',
    'https://www.vintagemovieposters.co.uk/wp-content/uploads/2019/10/IMG_1862.jpeg',
    'https://akcdn.detik.net.id/visual/2018/09/08/82611368-73d9-424f-810a-c6d8d7b36d96_169.jpeg?w=715&q=90',
    'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2022/02/eternals-gilgamesh-don-lee-2603725.jpg?tf=1080x',
    'https://nhiceyscribe.files.wordpress.com/2014/07/e8f58-miracleincellno7.jpg?w=600&h=888',
    'https://akcdn.detik.net.id/visual/2020/03/20/0fe05f90-9934-4e99-a059-b644368e48c0_169.jpeg?w=700&q=90',
    'https://about.vidio.com/wp-content/uploads/2021/11/Jumanji-Welcome-to-the-Jungle-ALT-1-Poster-Landscape.jpg',
    'https://assets.pikiran-rakyat.com/crop/0x0:0x0/703x0/webp/photo/2022/11/03/2316649718.jpg'
    // ... (your list of image URLs)
  ];

  final List<String> itemNames = [
    'TITANIC',
    'SING 2',
    'AQUAMAN',
    'AVANGERS',
    'THE NUN',
    'ETERNALS',
    'MIRACLE IN CELL NO.7',
    'DTHE COUNJURING 2',
    'JUMANJI',
    'AVATAR',
    // ... (your list of item names)
  ];

  final List<String> itemDescriptions = [
    'Sebuah film bencana romantis klasik.',
    'Sebuah film komedi musikal animasi.',
    'Sebuah film penuh aksi dengan pahlawan super.',
    'Sebuah film ensemble pahlawan super blockbuster.',
    'Sebuah film horor dari alam semesta The Conjuring.',
    'Sebuah film pahlawan super dengan tokoh Eternals.',
    'Sebuah film Korea Selatan yang menyentuh hati.',
    'Sebuah film horor untuk The Conjuring.',
    'Sebuah film komedi petualangan.',
    'Sebuah film fiksi ilmiah yang revolusioner.',
    // ... (your list of item descriptions)
  ];

  List<String> filteredItemNames = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItemNames.addAll(itemNames);
  }

  void filterSearchResults(String query) {
    List<String> searchResults = [];
    searchResults.addAll(itemNames);

    if (query.isNotEmpty) {
      searchResults.retainWhere((itemName) =>
          itemName.toLowerCase().contains(query.toLowerCase()));
    }

    setState(() {
      filteredItemNames = searchResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 213, 235),
        title: TextField(
          controller: searchController,
          onChanged: filterSearchResults,
          decoration: InputDecoration(
            hintText: 'Search by movie name...',
            hintStyle: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredItemNames.length,
        itemBuilder: (context, index) {
          String itemName = filteredItemNames[index];
          int originalIndex = itemNames.indexOf(itemName); // Get the original index

          return Card(
            color: Color.fromARGB(255, 255, 204, 242),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  // Image on the left
                  Image.network(
                    imageUrls[originalIndex],
                    width: 150.0,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 8.0), // Add spacing between image and text
                  // Text on the right
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        Text(
                          itemDescriptions[originalIndex],
                          style: TextStyle(fontSize: 14.0, color: Colors.black),
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
    );
  }
}
