import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> list = [];
  TextEditingController textEditingController = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text("Now available List : ${list.length}"),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: textEditingController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      list.add(textEditingController.text);
                      textEditingController.clear();
                    });
                  },
                  child: const Text("Add to List")),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("HomePage"),
          centerTitle: true),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Text(list[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // int counter = 0;

  // void _showDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return SimpleDialog(
  //         title: const Text("Counter"),
  //         children: [
  //           NumberStepper(
  //             initialValue: counter,
  //             onChanged: (value) {
  //               setState(() {
  //                 counter = value;
  //               });
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
  //       title: const Text("HomePage"),
  //       centerTitle: true,
  //     ),
  //     body: Center(
  //       child: Text("$counter", style: const TextStyle(fontSize: 18)),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: () {
  //         _showDialog();
  //       },
  //       child: const Icon(Icons.add),
  //     ),
  //   );
  // }
}
