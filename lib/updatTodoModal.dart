import 'package:flutter/material.dart';

import 'Todo.dart';

class UpdatTodoModal extends StatefulWidget {
  const UpdatTodoModal({
    super.key,
    required this.todo,
    required this.onTapUpdat,
  });

  final Todo todo;
  final Function(String) onTapUpdat;

  @override
  State<UpdatTodoModal> createState() => _UpdatTodoModalState();
}

class _UpdatTodoModalState extends State<UpdatTodoModal> {
  late TextEditingController todoTEC;

  @override
  void initState() {
    super.initState();
    todoTEC = TextEditingController(text: widget.todo.todoName);

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Add New Todo',style: TextStyle(fontSize: 25),),
              IconButton(onPressed: (){
                Navigator.pop(context);
              }, icon: const Icon(Icons.close))
            ],
          ),
          const SizedBox(height: 20,),
          TextFormField(
            controller: todoTEC,
            maxLines: 4,
            decoration: const InputDecoration(
                hintText: 'Enter a Text',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            widget.onTapUpdat(todoTEC.text.trim());

            Navigator.pop(context);
          }, child: const Text('UPDATED'))
        ],
      ),
    );
  }
}