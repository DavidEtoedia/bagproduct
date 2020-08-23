import 'package:flutter/material.dart';

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon:
            Icon(Icons.favorite, color: _isFavorite ? Colors.red : Colors.grey),
        onPressed: () {
          setState(() {
            if (_isFavorite) {
              _isFavorite = false;
            } else {
              _isFavorite = true;
            }
          });
        });
  }
}
