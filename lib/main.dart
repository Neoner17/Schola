import 'package:flutter/material.dart';
import 'productDetails.dart';
import 'FavoritesPage.dart';
import 'ProfilePage.dart';
import 'SearchPage.dart';


void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RapMarket'),
        backgroundColor: Colors.pink,
      ),
      backgroundColor: Colors.red,
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (_currentIndex == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            } else if (_currentIndex == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
            } else if (_currentIndex == 3) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Домой',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    switch (_currentIndex) {
      case 0:
        return ProductGrid(
          imageContent: ImageUrls,
          textContent: textContent,
          priceContent: ProductPriceList,
        );
      default:
        return Container();
    }
  }
}

class ProductGrid extends StatelessWidget {
  final List<String> imageContent;
  final List<String> textContent;
  final List<double> priceContent;

  ProductGrid({
    required this.imageContent,
    required this.textContent,
    required this.priceContent,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      children: List.generate(imageContent.length, (index) {
        return ProductCard(
          imageUrl: imageContent[index],
          productName: textContent[index],
          productPrice: priceContent[index],
          productDescription: productDescription[index],
        );
      }),
    );
  }
}



class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final double productPrice;
  final String productDescription;

  ProductCard({
    required this.imageUrl,
    required this.productName,
    required this.productPrice,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FadeTransition(
                        opacity: Tween<double>(
                          begin: 0.0,
                          end: 1.0,
                        ).animate(CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeInOut,
                        )),
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut,
                          )),
                          child: ProductDetailsPage(
                            ImageContent: imageUrl,
                            TextContent: productName,
                            productDescription: productDescription,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 120,
                width: double.infinity,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              '\$${productPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              productName,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}