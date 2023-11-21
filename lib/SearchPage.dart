import 'package:flutter/material.dart';
import 'main.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 20),
            _buildSearchResult('Result 1'),
            _buildSearchResult('Result 2'),
            _buildSearchResult('Result 3'),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter zapros...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildSearchResult(String resultText) {
    return Card(
      child: ListTile(
        title: Text(resultText),
        onTap: (){

        },
      ),
    );
  }

}