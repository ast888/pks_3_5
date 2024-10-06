import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/note.dart';
import 'package:flutter_application_1/pages/note_page.dart';
import 'package:flutter_application_1/models/cart.dart';

class ItemNote extends StatefulWidget {
  const ItemNote({
    Key? key,
    required this.notes,
    required this.cart,
    required this.onFavoriteToggle,
    required this.isFavorite,
  }) : super(key: key);

  final Note notes;
  final Cart cart;
  final Function(Note) onFavoriteToggle;
  final bool isFavorite;

  @override
  _ItemNoteState createState() => _ItemNoteState();
}

class _ItemNoteState extends State<ItemNote> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotePage(note: widget.notes, cart: widget.cart),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(205, 255, 255, 255),
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: const Color.fromARGB(115, 255, 255, 255),
              width: 4.0,
            ),
          ),
          width: double.infinity,
          height: 600,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: AssetImage(widget.notes.photo_id),
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${widget.notes.price} ₽',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 128, 0, 0)),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.notes.title,
                    style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        widget.cart.addItem(widget.notes);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Вы добавили в корзину ${widget.notes.title} за ${widget.notes.price}')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Icon(Icons.shopping_cart, size: 24),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: isFavorite ? Colors.red : const Color.fromARGB(255, 198, 187, 186),
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite; // Переключаем состояние избранного
                      widget.onFavoriteToggle(widget.notes); // Вызываем функцию добавления/удаления
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(isFavorite ? 'Вы добавили в избранное ${widget.notes.title}' : 'Вы убрали из избранного ${widget.notes.title}')),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
