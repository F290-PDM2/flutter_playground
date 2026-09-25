import 'package:flutter/material.dart';

class MaterialDesignPage extends StatefulWidget {
  const MaterialDesignPage({super.key});

  @override
  State<MaterialDesignPage> createState() => _MaterialDesignPageState();
}

class _MaterialDesignPageState extends State<MaterialDesignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF0EDE7),
      appBar: AppBar(title: Text('Material Design')),
      body: Column(
        mainAxisAlignment: .start,
        crossAxisAlignment: .center,
        mainAxisSize: .max,
        children: [
          SizedBox(width: double.infinity),
          ElevatedButton(onPressed: () {}, child: Text('FilledButton')),
          FilledButton(onPressed: () {}, child: Text('FilledButton')),
          TextButton(onPressed: () {}, child: Text('FilledButton')),
          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
          Switch(value: true, onChanged: (value) {}),
          TextField(
            decoration: InputDecoration(
              hintText: 'Hint text',
              labelText: 'Label text',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
