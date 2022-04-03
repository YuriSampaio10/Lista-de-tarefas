import 'package:flutter/material.dart';
import 'package:list/models/date_tyme.dart';
import 'package:list/repositories/todo_repositorie.dart';
import 'package:list/widgets/listStyle.dart';
import '../models/date_tyme.dart';

class toDolistPage extends StatefulWidget {
  @override
  State<toDolistPage> createState() => _toDolistPageState();
}

class _toDolistPageState extends State<toDolistPage> {
  final TextEditingController todoControler = TextEditingController();
  final TodoRepository todoRepository = TodoRepository();
  // pegar o que foi digitado
  List<Todo> todos = []; // lista que é criada
  Todo? deletedTodo; // variável que recebe a tarefa deletada
  int? deletedTodoPosition; // variável que recebe a posição da tarefa deletada

 @override
  void initState() {
    super.initState();

    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // não deixa os componentes passar da area segura e invadisr a status bar
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // define que o colum pegue a altura minima da tela e não a total
              children: [
                Row(
                  children: [
                    Expanded(
                      // diz que o texto pode ocupar todo o lugar disponivel na row
                      flex:
                          4, // diz que o campo de texto tem que ser quatro vezes maior
                      child: TextField(
                        controller: todoControler, // pegar o que foi digitado

                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Adicionar uma Tarefa',
                          hintText: ' Ex.: estudar',
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String text =
                            todoControler.text; // pegar o que foi digitado
                        setState(() {
                          Todo newTodo =
                              Todo(title: text, dateTime: DateTime.now());
                          todos.add(
                              newTodo); // adicionar o que foi escrito na lista todos
                        });
                        todoControler.clear();
                        todoRepository.saveTodoList(todos);
                      },
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 35),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                        56,
                        57,
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Flexible(
                  // assim que a lista nao tiver mais pra onde crescer ela cria o campo para rolar
                  child: ListView(
                    // igual a coluna, so que ela permite colocar alem do espaço permitido
                    shrinkWrap:
                        true, // faz com que a lista ocupe o maximo possivel da tela
                    children: [
                      for (Todo todo in todos)
                        listStyle(
                          todo: todo,
                          onDelete: onDelete, // deletar tarefa
                        )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Text(
                        'você possui ${todos.length} tarefas pendentes',
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      onPressed: showDeletedTodosDialog,
                      child: Text(
                        'limpar tudo',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                        110,
                        57,
                      )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

// deletar tarefa
  void onDelete(Todo todo) {
    deletedTodo = todo; // armazena a tarefa apagada na variável
    deletedTodoPosition =
        todos.indexOf(todo); // armazena a posição da tarefa apagada
    setState(() {
      todos.remove(todo);

      ScaffoldMessenger.of(context)
          .clearSnackBars(); // limpa os snackbar exibidos antes de aparecer outro snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        // snackbar das tarefas apagadas
        SnackBar(
          content: Text(
            "tarefa ${todo.title} foi removida com sucesso!",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          action: SnackBarAction(
            label: "desfazer", // botão desfazer quando deletar
            onPressed: () {
              setState(() {
                todos.insert(deletedTodoPosition!,
                    deletedTodo!); // reinsere o que foi deletado na posição
              });
            },
          ),
          duration: const Duration(seconds: 6), // duração da snackbar na tela
        ),
      );
    });
  }

// diálogo de alerta
  void showDeletedTodosDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Limpar tudo?'),
        content: Text("Você tem certeza que deseja apagar todas as tarefas?"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // fecha a caixa de diálogo
              },
              child: Text('Cancelar')),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // fecha a caixa de diálogo
              delletAllTodos();
            },
            child: Text('Limpar'),
            style: TextButton.styleFrom(
              primary: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  void delletAllTodos() {
    setState(() {
      todos.clear();
      print('oi');
    });
  }
}
