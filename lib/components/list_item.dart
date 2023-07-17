import 'package:flutter/material.dart';


class ListItem extends StatefulWidget {
  const ListItem({Key? key, required this.title, required this.icon, required this.onPressed}) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        child: Row(
          children: [
            Icon(widget.icon),
            SizedBox(width: 10,),
            Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
          ],
        ),
      ),
    );
  }
}
