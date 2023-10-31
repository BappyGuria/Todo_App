import 'package:flutter/material.dart';

import 'Todo.dart';

class AddNewTodoModel extends StatefulWidget {
  const AddNewTodoModel({
    super.key,
    required this.onAddTap,
  });
final Function (Todo) onAddTap;

  @override
  State<AddNewTodoModel> createState() => _AddNewTodoModelState();
}

class _AddNewTodoModelState extends State<AddNewTodoModel> {
  TextEditingController todoTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
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
              validator: (String? value){
                if(value == null || value .isEmpty){
                  return 'Enter a Input';
                }
                return null;
              },
            ),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState! .validate()){
                Todo todo = Todo(todoName: todoTEC.text.trim(), currentTime: DateTime.now(), updatTime: DateTime.now(), statas: 'Pending');
                widget.onAddTap(todo);

                Navigator.pop(context);
              }
            }, child: const Text('Add'))
          ],
        ),
      ),
    );
  }
}