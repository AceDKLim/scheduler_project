import 'package:scheduler/models/todo.dart';
import 'package:sqflite/sqflite.dart';

class TodoSqlite {
  late Database db;

  //db파일('my_db.db')과 연결 후 mytodo테이블 없으면 생성,아이디 값 자동 생성, db라는 인스턴스로 관리 -> SQL 쿼리 실행 가능
  Future initDb() async{
    db=await openDatabase('my_db.db');
    await db.execute('CREATE TABLE IF NOT EXISTS MyTodo (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT)',);
  }

  //db.query로 테이블과 컬럼 설정해 가져옴. List< frommap으로 
  Future<List<Todo>> getTodos() async{
    List<Todo> todos=[];
    List<Map> maps=await db.query('MyTodo',columns: ['id','title','description']);
    maps.forEach((map) {todos.add(Todo.fromMap(map));});
    return todos;
  }

  Future<Todo?> getTodo(int id)async{
    List<Map> map=await db.query('MyTodo',columns: ['id','title','description'],where: 'id = ?',whereArgs: [id]);
    if(map.length>0){
      return Todo.fromMap(map[0]);
    }
  }

  Future addTodo(Todo todo)async{
    int id=await db.insert('MyTodo', todo.toMap());
  }

  Future deleteTodo(int id)async{
    await db.delete('MyTodo',where: 'id = ?',whereArgs: [id]);
  }

    Future updateTodo(Todo todo)async{
    await db.update('MyTodo',todo.toMap(),where: 'id = ?',whereArgs: [todo.id]);
  }
}