import 'package:flutter/material.dart';
import 'main.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildFavoriteCard('Product 1'),
            _buildFavoriteCard('Product 2'),
            _buildFavoriteCard('Product 3'),
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(String productName) {
    return Card(
      child: ListTile(
        title: Text(productName),
        subtitle: Text('Description'),
        onTap: () {
        },
      ),
    );
  }
}