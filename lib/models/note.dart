import 'package:flutter/material.dart';

class Note {
  final String id;
  final String photo_id;
  final String title;
  final String description;
  final String price;
  final String ram; // Оперативная память
  final String simCards; // Количество SIM-карт
  final String supports5G; // Поддержка 5G
  final String screenSize; // Диагональ экрана
  final String refreshRate; // Герцовка
  final String camera; // Камера
  bool isLiked; // Добавляем поле isLiked
  final String processor; // Процессор
  

  Note({
    required this.id,
    required this.photo_id,
    required this.title,
    required this.description,
    required this.price,
    required this.ram,
    required this.simCards,
    required this.supports5G,
    required this.screenSize,
    required this.refreshRate,
    required this.camera,
    required this.processor,
    this.isLiked = false, // По умолчанию не избранное
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Note &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.photo_id == photo_id;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode ^ price.hashCode ^ photo_id.hashCode;
}
