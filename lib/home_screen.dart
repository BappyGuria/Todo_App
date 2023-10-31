import 'package:flutter/material.dart';
import 'Todo.dart';
import 'addNewTask.dart';
import 'updatTodoModal.dart';

class Home_Paje extends StatefulWidget {
  const Home_Paje({super.key});

  @override
  State<Home_Paje> createState() => _Home_PajeState();
}

class _Home_PajeState extends State<Home_Paje> {

  List<Todo> TodoList = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context){
            return AddNewTodoModel(onAddTap: (Todo todo) {
              addTodo(todo);
            },);
          },);
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: TodoList.length,
        itemBuilder: (context, index){
        return Card(
          child: ListTile(
            onTap: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  backgroundColor: Colors.pinkAccent,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.pop(context);
                          showModalBottomSheet(context: context, builder: (context){
                            return UpdatTodoModal(todo: TodoList[index], onTapUpdat: (String updatDatilsText) {
                              updatTodo(index, updatDatilsText);
                            },);
                          });
                        },
                        leading: const Icon(Icons.edit),
                        title: const Text('Edit'),
                      ),
                      ListTile(
                        onTap: (){
                          TodoList.remove(TodoList[index]);
                          Navigator.pop(context);

                          setState(() {

                          });
                        },
                        leading: const Icon(Icons.delete),
                        title: const Text('Delete'),
                      )
                    ],
                  ),
                );
              });
            },
            onLongPress: (){
              String currentStasus = TodoList[index].statas == 'Pending' ? 'Done' : 'Pending';

              updateTodoStatus(index, currentStasus);
            },
            leading: Text('${index + 1}'),
            title: Text(TodoList[index].todoName),
            subtitle: Text(TodoList[index].currentTime.toString()),
            trailing: Text(TodoList[index].statas),
          ),
        );
      },)
    );
  }
  void addTodo(Todo todo){
    TodoList.add(todo);

    setState(() {

    });
  }

  void updatTodo(int index, String todoUpdatName){
      TodoList[index].todoName = todoUpdatName;

      setState(() {

      });
  }

  void updateTodoStatus(int index, String status) {
    TodoList[index].statas = status;
    setState(() {});
  }
}


