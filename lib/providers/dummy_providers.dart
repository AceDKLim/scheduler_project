//Todo 모델을 자료형처럼 이용한 점이 재밌네

import 'package:scheduler/models/todo.dart';

class TodoDefault{
  List<Todo> dummyTodos=[
    Todo(id: 1,title: '플러터 공부하기', description: '플러터 개꿀잼'),
    Todo(id: 2,title: '스프링 공부하기', description: '약간 버려진듯'),
    Todo(id: 3,title: '깃 마스터', description: '나도 깃으로 협업 해보자'),
    Todo(id: 4,title: '뻐킹과제', description: 'ㄹㅇ 현타오는거 많네 특히 어...'),
  ];

  List<Todo> getTodos(){
    return dummyTodos;
  }

  Todo getTodo(int id){
    return dummyTodos[id];
  }

  Todo addTodo(Todo todo){
    Todo newTodo=Todo(id: dummyTodos.length+1, title: todo.title,description: todo.description);
    dummyTodos.add(newTodo);
    return newTodo;
  }

//입력된 id가 dummyTodos의 인덱스와 일치하지 않을 수 있음
  void deleteTodo(int id){
    for(int i=0;i<dummyTodos.length;i++){
      if(dummyTodos[i].id==id){
        dummyTodos.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo){
    for(int i=0;i<dummyTodos.length;i++){
      if(dummyTodos[i].id==todo.id){
        dummyTodos[i]=todo;
      }
    }
  }
}