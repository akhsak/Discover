import 'package:flutter/material.dart';
import 'package:discover/view/user/search/search.dart';
import 'package:discover/widgets/category_card.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              'assets/splash1.img.jpeg',
              height: size.height * 0.6,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Explore the world today',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Discover - take your travel to the next level',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const SearchPage()));
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Search destination',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            const Icon(Icons.search),
                          ],
                        ),
                      ),
                     // const SizedBox(height: 20),
                      
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CategoryCard(categoryName: 'Hotel', iconData: Icons.hotel),
                            CategoryCard(categoryName: 'Message', iconData: Icons.message),
                            CategoryCard(categoryName: 'Oversea', iconData: Icons.flight),
                            CategoryCard(categoryName: 'Restaurant', iconData: Icons.restaurant),
                            // Add more categories as needed
                          ],
                        ),
                      ),
                      SizedBox(height: 50,),
                      SizedBox(
                        height: size.height*0.1,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4, // Number of items in the list
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    // child: Image.asset(
                                    //   'assets/image${index + 1}.jpg', // Image path
                                    //   height: 150,
                                    //   width: 120,
                                    //   fit: BoxFit.cover,
                                    // ),
                                    child: Image.asset('assets/splash1.img.jpeg',
                                    height: 200,
                                    width: 100,
                                    fit: BoxFit.contain,),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class CategoryCard extends StatelessWidget {
//   final String categoryName;
//   final IconData iconData;

//   const CategoryCard({super.key, required this.categoryName, required this.iconData});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.white.withOpacity(0.8),
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(iconData),
//             const SizedBox(width: 8),
//             Text(
//               categoryName,
//               style: const TextStyle(fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SearchPage extends StatelessWidget {
//   const SearchPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Search'),
//       ),
//       body: const Center(
//         child: Text('Search Page Content'),
//       ),
//     );
//   }
// }

