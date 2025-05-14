import 'package:flutter/material.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('{{name.pascalCase()}} Page')),
      body: Center(child: Text('This is the {{name}} page.')),
    );
  }
}
