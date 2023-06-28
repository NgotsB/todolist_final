import 'package:flutter/material.dart';
import 'package:todo_list/app/config/app_colors.dart';

import '../../models/todo.model.dart';


class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;
  final bool isNormal;

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
    required this.isNormal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: AppColors.primary,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.dark,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: ElevatedButton(
          style:  ElevatedButton.styleFrom(
            elevation: 1,
            backgroundColor: isNormal ? Colors.white : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
            ),
          ),
          child: const Icon(Icons.delete),
          onPressed: () { onDeleteItem(todo.id); },
        ),
      ),
    );
  }
}
