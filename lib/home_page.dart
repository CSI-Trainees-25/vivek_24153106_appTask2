import 'package:coffeeshop/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:coffeeshop/item_tile.dart';
import 'package:coffeeshop/item_page.dart';
import 'package:coffeeshop/cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;
  List<MenuItem> menu = [
    MenuItem(
      name: 'Espresso',
      price: '10',
      imagePath: 'assets/espresso.png',
      rating: '4.2',
    ),
    MenuItem(
      name: 'Latte',
      price: '20',
      imagePath: 'assets/latte.png',
      rating: '5',
    ),
  ];

  void _navigateToItemPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ItemPage(menu[index])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(actions: [Image.asset('assets/appBar.png')]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(23, 14, 23, 23),
            child: SizedBox(
              width: 223,
              child: Text(
                'Find the best Coffee to your taste',
                style: GoogleFonts.inter(
                  color: Color.fromRGBO(68, 68, 68, 1),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsGeometry.all(15),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Find your coffee...",
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.circular(100),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.circular(100),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.circular(100),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _createCategoryCard('Espresso', true),
                  SizedBox(width: 8),
                  _createCategoryCard('Latte', false),
                  SizedBox(width: 8),
                  _createCategoryCard('Cappuccino', false),
                  SizedBox(width: 8),
                  _createCategoryCard('CafeMocha', false),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menu.length,
              itemBuilder: (context, index) => ItemTile(
                menu[index],
                onTap: () {
                  _navigateToItemPage(index);
                },
              ),
            ),
          ),
          SizedBox(height: 10),
          Text('Special for you', style: GoogleFonts.inter(fontSize: 20)),
          Container(
            child: Row(
              children: [
                Image.asset('assets/bannerImage.png', width: 100),
                Column(
                  children: [
                    Text('Something Coffee'),
                    Text('Something about the coffee'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentTabIndex,
        onDestinationSelected: (index) {
          setState(() => _currentTabIndex = index);
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => CartPage()),
            );
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Likes',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.notifications_none),
            selectedIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _createCategoryCard(String label, bool selected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected
            ? Color.fromRGBO(150, 114, 89, 1)
            : Color.fromRGBO(0, 0, 0, 0.05),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: selected ? Colors.white : Colors.black87,
        ),
      ),
    );
  }
}
