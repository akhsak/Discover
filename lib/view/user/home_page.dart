import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/splash1.img.jpeg',
              height: size.height * 0.9,
              // Replace with your background image path
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore the world today',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Discover - take your travel to the next level',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search destination',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 50, // Height of the horizontal categories scroll
                //   child: ListView(
                //     scrollDirection: Axis.horizontal,
                //     children: const [
                //       CategoryCard(categoryName: 'Hotel'),
                //       CategoryCard(categoryName: 'Message'),
                //       CategoryCard(categoryName: 'Oversea'),
                //       // Add more categories as needed
                //     ],
                //   ),
                // ),
                // // Add more content below if needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;

  const CategoryCard({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Center(
          child: Text(
            categoryName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
