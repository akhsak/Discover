import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/splash1.img.jpeg',
              height: size.height * 0.5,
              fit: BoxFit.fill,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explore the world today',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Discover - take your travel to the next level',
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search destination',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                      //  SizedBox(height: 20,),
                      // Padding(
                      //   padding: EdgeInsets.symmetric(horizontal: 24),
                      //   child: Row(
                      //     children: [
                      //       Container(
                      //         height: 40,
                      //         width: size.width*0.3,
                      //         decoration: BoxDecoration(
                      //           color: Colors.white,
                      //           borderRadius: BorderRadius.circular(16),
                      //         ),
                      //         alignment: Alignment.center,

                      //         child: Text(
                      //           'hotel',
                      //           style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                      //         ),
                      //       )
//                           ],
//                         ),
//                       )

                      SizedBox(height: 20),
                      SizedBox(
                        height: 70,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [
                            CategoryCard(
                                categoryName: 'Hotel', iconData: Icons.abc),
                            CategoryCard(
                                categoryName: 'Message', iconData: Icons.home),
                            CategoryCard(
                                categoryName: 'Oversea', iconData: Icons.face),
                            CategoryCard(
                                categoryName: 'Hotel', iconData: Icons.abc),
                            CategoryCard(
                                categoryName: 'Message', iconData: Icons.home),
                            CategoryCard(
                                categoryName: 'Oversea', iconData: Icons.face),
                            // Add more categories as needed
                          ],
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

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final IconData iconData;

  const CategoryCard(
      {Key? key, required this.categoryName, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData),
            SizedBox(width: 8),
            Text(
              categoryName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
