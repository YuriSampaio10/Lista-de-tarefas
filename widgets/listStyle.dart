import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:list/models/date_tyme.dart';
import '../models/date_tyme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class listStyle extends StatelessWidget {
  const listStyle({Key? key, required this.todo, required this.onDelete })
      : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete; // deletar tarefa

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Slidable(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch, // coloca os textos no inicio
              children: [
                Text(
                  DateFormat('dd-MM-yyyy - HH:mm').format(todo.dateTime),
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  todo.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        actionExtentRatio: 0.15,
        actionPane: SlidableStrechActionPane(),
        secondaryActions: [
          IconSlideAction(
            color: Colors.red,
            icon: Icons.delete,
            onTap: () {
              onDelete(todo); // deletar tarefa
            },
            caption: 'Deletar',
          ),
          /*IconSlideAction(
            color: Colors.blueAccent,
            icon: Icons.delete,
            onTap: () {},
            caption: 'editar',
          ),*/
        ],
      ),
    );
  }
}
