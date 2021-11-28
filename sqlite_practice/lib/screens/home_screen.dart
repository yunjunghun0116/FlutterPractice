import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextField(
        controller: textController,
      )),
      body: Center(
        child: FutureBuilder<List<Grocery>>(
          future: DatabaseHelper.instance.getGroceries(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Grocery>> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text('Loading...'),
              );
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text('No Groceries in List'),
                  )
                : ListView(
                    children: snapshot.data!.map((grocery) {
                      return Center(
                        child: Card(
                          color: selectedId == grocery.id
                              ? Colors.white70
                              : Colors.white,
                          child: ListTile(
                            onTap: () {
                              setState(() {
                                if (selectedId == null ||
                                    selectedId != grocery.id) {
                                  textController.text = grocery.name;
                                  selectedId = grocery.id;
                                } else {
                                  textController.clear();
                                  selectedId = null;
                                }
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                DatabaseHelper.instance.remove(grocery.id!);
                              });
                            },
                            title: Text(grocery.name),
                          ),
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          selectedId != null
              ? await DatabaseHelper.instance
                  .update(Grocery(name: textController.text, id: selectedId))
              : await DatabaseHelper.instance
                  .addGrocery(Grocery(name: textController.text));
          setState(() {
            textController.clear();
            selectedId = null;
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }
}

//1. 저장할때 필요한 클래스를 생성(Food/User 등등)
class Grocery {
  final int? id;
  final String name;

  Grocery({this.id, required this.name});
  // json으로 받아온 값을 어떠한 객체로 변환해주는 과정
  factory Grocery.fromMap(Map<String, dynamic> json) => Grocery(
        id: json['id'],
        name: json['name'],
      );
  // 저장할때 필요 ex) insert/update
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class DatabaseHelper {
  // Singleton 디자인패턴 -> 오직 하나만 존재
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'groceries.db');
    //db를 생성하는 작업
    return await openDatabase(
      //db의 어디에 저장을 할것인지
      path,
      version: 1,
      //실제 컬렉션과 같이 접근가능한 장소
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    // 이곳에서 여러개의 테이블을 생성하고 접근한다
    await db.execute('''
      CREATE TABLE groceries(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        name TEXT
      )
    ''');
  }

  Future<List<Grocery>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('groceries', orderBy: 'name');
    List<Grocery> groceryList = groceries.isNotEmpty
        ? groceries.map((e) => Grocery.fromMap(e)).toList()
        : [];

    return groceryList;
  }

  Future<int> addGrocery(Grocery grocery) async {
    //마지막 key값 뒤에 더하는 방식
    Database db = await instance.database;
    int a = await db.insert('groceries', grocery.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print('int값 : $a');
    return a;
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('groceries', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Grocery grocery) async {
    Database db = await instance.database;
    return await db.update('groceries', grocery.toMap(),
        where: 'id = ?', whereArgs: [grocery.id]);
  }
}
