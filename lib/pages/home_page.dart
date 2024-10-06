import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/item_note.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/models/note.dart';

// Ваш список товаров
final List<Note> notes = <Note>[
  Note(
    id: '1',
    photo_id: 'assets/photo/16PM.jpg',
    title: 'iPhone 16 Pro Max 256 ГБ nano SIM+eSIM Natural Titanium',
    description: '',
    price: '189600',
    ram: '8 ГБ',
    simCards: '1 (SIM+ESIM)',
    supports5G: 'Да',
    screenSize: '6.7 дюйма',
    refreshRate: '120 Гц',
    camera: '48 МП',
    processor: 'A16 Bionic',
  ),
  Note(
    id: '2',
    photo_id: 'assets/photo/15PM.jpg',
    title: 'iPhone 15 Pro Max 256 ГБ, Dual nano SIM, титан',
    description: '',
    price: '104500',
    ram: '8 ГБ',
    simCards: '2 (DUAL SIM)',
    supports5G: 'Да',
    screenSize: '6.7 дюйма',
    refreshRate: '120 Гц',
    camera: '48 МП',
    processor: 'A16 Bionic',
  ),
  Note(
    id: '3',
    photo_id: 'assets/photo/13.jpg',
    title: 'Apple iPhone 13 128 ГБ RU, nano SIM+eSIM, тёмная ночь',
    description: '',
    price: '49500',
    ram: '4 ГБ',
    simCards: '2 (DUAL SIM)',
    supports5G: 'Да',
    screenSize: '6.1 дюйма',
    refreshRate: '60 Гц',
    camera: '12 МП',
    processor: 'A15 Bionic',
  ),
  Note(
    id: '4',
    photo_id: 'assets/photo/15.jpg',
    title: 'iPhone 15 128 ГБ, Dual nano SIM, голубой',
    description: '',
    price: '64800',
    ram: '6 ГБ',
    simCards: '1 (SIM+ESIM)',
    supports5G: 'Да',
    screenSize: '6.1 дюйма',
    refreshRate: '60 Гц',
    camera: '12 МП',
    processor: 'A16 Bionic',
  ),
];

class HomePage extends StatefulWidget {
  final List<Note> favoriteNotes; // Список избранных заметок
  final Function(Note) addToFavorites; // Функция добавления в избранное

  const HomePage({
    Key? key,
    required this.favoriteNotes,
    required this.addToFavorites,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Cart cart = Cart(); // Создаем корзину

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Горбушкин Дворик')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(cart: cart), // Переход на страницу корзины
                ),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.45,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: notes.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemNote(
            notes: notes[index],
            cart: cart,
            onFavoriteToggle: widget.addToFavorites,
            isFavorite: widget.favoriteNotes.contains(notes[index]),
          );
        },
      ),
    );
  }
}
