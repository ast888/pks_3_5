import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/favorite_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart'; // Импортируем ProfilePage
import 'package:flutter_application_1/models/note.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  ScreenState createState() => ScreenState();
}

class ScreenState extends State<Screen> {
  int _selectedIndex = 0;
  List<Note> favoriteNotes = []; // Список избранных товаров

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void addToFavorites(Note note) {
    setState(() {
      if (!favoriteNotes.contains(note)) {
        favoriteNotes.add(note);
      }
    });
  }

  void removeFromFavorites(Note note) {
    setState(() {
      favoriteNotes.remove(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? HomePage(
              favoriteNotes: favoriteNotes, // Передаем список избранных заметок
              addToFavorites: addToFavorites, // Передаем функцию добавления
            )
          : _selectedIndex == 1
              ? FavoritesPage(
                  favoriteNotes: favoriteNotes,
                  removeFromFavorites: removeFromFavorites, // Передаем функцию удаления
                )
              : ProfilePage(), // Добавляем ProfilePage для третьего индекса
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 32, 100, 156),
        onTap: _onItemTapped,
      ),
    );
  }
}
