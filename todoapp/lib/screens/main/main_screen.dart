import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoapp/screens/add/add_screen.dart';
import 'package:todoapp/screens/todo/todo_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Todo'),
            Tab(text: 'Doing'),
            Tab(text: 'Finished'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          TodoScreen(state: 0),
          TodoScreen(state: 1),
          TodoScreen(state: 2),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
