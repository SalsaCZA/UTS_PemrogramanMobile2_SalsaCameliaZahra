import "package:flutter/material.dart";

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _ComingSoonState();
}

class _ComingSoonState extends State<ComingSoon> {
  // List of image URLs
  final List<String> imageUrls = [
    'https://media.21cineplex.com/webcontent/gallery/pictures/170012554599976_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/170011877651368_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/169814053012710_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/170013030531421_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/170013399484507_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/169995102266798_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/169900503369766_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/169900459420267_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/168680244248994_405x594.jpg',
    'https://media.21cineplex.com/webcontent/gallery/pictures/169417594837304_405x594.jpg'
    // ... (your list of image URLs)
  ];

  // List of custom names for each item
  final List<String> itemNames = [
    'THE DIVE',
    'THE ANIMAL KINGDOM',
    'THE TREE MUSKETEERS',
    'WONKA',
    'WONKA (IMAX 2D)',
    'ALL FUN AND GAMES',
    'NAPOLEON',
    'THANKSGIVING',
    'THE FRIENDSHIP GAME',
    'ONE TRUE LOVES',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 213, 235),
        title: Text(
          'COMINGSOON',
          style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'COMINGSOON ON DECEMBER',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the number of columns as needed
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: 10, // Adjust the number of items in the GridView
              itemBuilder: (context, index) {
                // Use modulo to repeat images and names if there are fewer URLs and names than items
                String imageUrl = imageUrls[index % imageUrls.length];
                String itemName = itemNames[index % itemNames.length];

                return Card(
                  color: Color.fromARGB(255, 255, 204, 242),
                  child: Padding(
                    padding: const EdgeInsets.all(
                        10.0), // Adjust the padding as needed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              imageUrl,
                              width: 120.0, // Adjust the width as needed
                              height: 120.0, // Adjust the height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(itemName), // Display custom name for each item
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
