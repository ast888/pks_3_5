import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cart.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/pages/note_page.dart';

class CartPage extends StatelessWidget {
  final Cart cart;

  const CartPage({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Корзина'),
      ),
      body: ValueListenableBuilder<List<Note>>(
        valueListenable: cart,
        builder: (context, items, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final Note note = items[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NotePage(note: note, cart: cart),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 4,
                          child: ListTile(
                            leading: Image.asset(
                              note.photo_id,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(note.title),
                            subtitle: Text('Цена: ${note.price} ₽'),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                cart.removeItem(note); // Удаляем товар из корзины
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('${note.title} удален из корзины')),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow, // Цвет фона кнопки
                      foregroundColor: Colors.black, // Цвет текста кнопки
                      padding: const EdgeInsets.symmetric(vertical: 16.0), // Отступы
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0), // Закругленные углы
                      ),
                    ),
                    onPressed: () {
                      // Логика оформления заказа
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Оформление заказа'),
                          content: const Text('Спасибо за ваш заказ!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                cart.clear(); // Очищаем корзину
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Оформить заказ'),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
