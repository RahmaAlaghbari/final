import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../views/setting_page.dart';


class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 2); // Adjust the height as needed
}

class _SearchAppBarState extends State<SearchAppBar> {
  bool _isSearching = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.blueGrey,
      title: _isSearching ? _buildSearchField() : _buildTitle(),
      actions: [
        IconButton(
          icon: Icon(
            _isSearching ? Icons.close : Icons.search,
            color: Colors.white,
          ),
          onPressed: _toggleSearch,
        ),
        IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            // Handle settings button press
          },
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Container(
      color: Colors.blueGrey, // Adjust the color as desired
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
          onChanged: (value) {
            // Handle search text changes
          },
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'myReservs',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
    );
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
  }
}