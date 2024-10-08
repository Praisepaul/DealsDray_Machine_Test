import 'package:flutter/material.dart';

import '../widgets/OfferCard.dart';
import '../widgets/category_card.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 3) {
      Navigator.pushNamed(context, '/cart');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            // Hamburger Menu Icon
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
              },
            ),
            
            // Expanded search bar
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          // Handle search action
                          print("Search clicked");
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Menu Icon on the right
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Handle additional menu actions (e.g., open options)
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Offer Posters
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    OfferCard(imagePath: 'assets/offer1.png'),
                    OfferCard(imagePath: 'assets/offer2.png'),
                    OfferCard(imagePath: 'assets/offer3.png'),
                  ],
                ),
              ),
            ),

            // KYC Reminder Card
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.amberAccent,
                child: ListTile(
                  leading: const Icon(Icons.warning, color: Colors.red),
                  title: const Text('KYC Pending'),
                  subtitle: const Text('You need to verify your KYC, click here.'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    // Handle KYC action
                  },
                ),
              ),
            ),

            // Categories Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard(categoryName: 'Electronics', icon: Icons.devices),
                  CategoryCard(categoryName: 'Groceries', icon: Icons.shopping_basket),
                  CategoryCard(categoryName: 'Clothing', icon: Icons.checkroom),
                  CategoryCard(categoryName: 'Kids', icon: Icons.child_care),
                  CategoryCard(categoryName: 'Mobile Phones', icon: Icons.phone_android),
                  CategoryCard(categoryName: 'Men', icon: Icons.man),
                  CategoryCard(categoryName: 'Women', icon: Icons.woman),
                ],
              ),
            ),

            // Products List 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                'Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ProductCard(
                  productName: 'Product $index',
                  price: 100 + index * 10,
                  imagePath: 'assets/product_image.png',
                );
              },
            ),
          ],
        ),
      ),

      // Floating Chat Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle chat action
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.chat),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),BottomNavigationBarItem(
            icon: Image.asset(
              'assets/logo.png',
              height: 30,
            ),
            label: 'Deals',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


