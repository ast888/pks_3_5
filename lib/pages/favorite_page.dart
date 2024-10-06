import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/models/cart.dart';

class FavoritesPage extends StatelessWidget {
  final List<Note> favoriteNotes; // Список избранных товаров
  final Function(Note) removeFromFavorites; // Функция для удаления из избранного

  const FavoritesPage({
    super.key,
    required this.favoriteNotes,
    required this.removeFromFavorites,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Избранное'),
      ),
      body: favoriteNotes.isEmpty
          ? const Center(
              child: Text(
                'Нет избранных товаров',
                style: TextStyle(fontSize: 20),
              ),
            )
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.45,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: favoriteNotes.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemNote(
                  notes: favoriteNotes[index],
                  cart: Cart(), // Передайте вашу корзину, если нужно
                  onFavoriteToggle: (note) {
                    removeFromFavorites(note); // Удаляем из избранного
                  },
                  isFavorite: true, // Указываем, что это избранное
                );
              },
            ),
    );
  }
}
