import 'package:flutter/foundation.dart';
import 'note.dart';

class Cart extends ValueNotifier<List<Note>> {
  Cart() : super([]);

  // Добавить товар в корзину
  void addItem(Note note) {
    value.add(note);
    notifyListeners(); // Уведомляем слушателей об изменении
  }

  // Удалить товар из корзины
  void removeItem(Note note) {
    value.remove(note);
    notifyListeners(); // Уведомляем слушателей об изменении
  }

  // Получить товары в корзине
  List<Note> get items => value;

  // Очистить корзину
  void clear() {
    value.clear();
    notifyListeners(); // Уведомляем слушателей об изменении
  }

  // Получить общую стоимость товаров в корзине
  double get totalPrice {
    return value.fold(0, (sum, item) {
      String priceString = item.price.toString();
      return sum + double.parse(priceString.replaceAll(' ₽', ''));
    });
  }
}
