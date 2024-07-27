import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchWidget extends StatefulWidget {
  final void Function(String) onSearch;

  const SearchWidget({required this.onSearch, Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextField(
        controller: _controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              widget.onSearch(_controller.text);
            },
            icon: Icon(Icons.search),
          ),
          border: InputBorder.none,
        ),
        onSubmitted: (value) {
          widget.onSearch(value);
        },
      ).pOnly(right: 5, left: 5),
    );
  }
}
