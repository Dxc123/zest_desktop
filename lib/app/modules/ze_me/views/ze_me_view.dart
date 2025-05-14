import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/ze_me_controller.dart';

class ZeMeView extends StatefulWidget {
  const ZeMeView({super.key});

  @override
  State<ZeMeView> createState() => _ZeMeViewState();
}

class _ZeMeViewState extends State<ZeMeView> {
  final controller = Get.put<ZeMeController>(ZeMeController());

  List<TodoItem> items = [];
  double _slideProgress = 0.0;

  @override
  void initState() {
    super.initState();
    TodoItem item;
    for (int i = 0; i < 15; i++) {
      item = TodoItem("id $i", "title$i");
      items.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible Widget Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.blue,
              size: 40,
            ),
            onPressed: () {
              Get.toNamed(Routes.ZT_DEMO_TEST);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (ctx, index) {
            final item = items[index];
            return Dismissible(
              key: Key(item.id),
              direction: DismissDirection.endToStart,
              background: _buildDeleteBackground(),
              onUpdate: (details) => setState(() => _slideProgress = details.progress),
              confirmDismiss: (_) => _confirmDelete(item),
              onDismissed: (_) => _handleDelete(item),
              movementDuration: const Duration(milliseconds: 500),
              // 延长滑动动画时间
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 80), // 限制高度提升性能
                child: ListTile(
                  title: Text(item.title),
                  subtitle: const Text("滑动删除"),
                ),
              ),
            );
          },
        ),
      ),
      // floatingActionButton:  FloatingActionButton(
      //   onPressed: ()  {
      //      controller.apiBanner();
      //   },
      //   child: const Icon(Icons.add_a_photo),
      // ),
    );
  }

  Widget _buildDeleteBackground() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Opacity(
            opacity: _slideProgress.clamp(0.0, 1.0),
            child: const Icon(Icons.delete, size: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Future<bool> _confirmDelete(TodoItem item) async {
    return await showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("删除 ${item.title}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text("取消"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text("删除"),
          ),
        ],
      ),
    );
  }

  void _handleDelete(TodoItem item) {
    setState(() => items.removeWhere((i) => i.id == item.id));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("已删除 ${item.title}")),
    );
  }
}

class TodoItem {
  TodoItem(this.id, this.title);

  final String id;
  final String title;
}
