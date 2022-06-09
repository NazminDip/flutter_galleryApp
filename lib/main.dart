import 'package:flutter/material.dart';

import 'home_page.dart';

// ignore: unnecessary_const
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const _title = 'Gallery App';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UiPage(),
    );
  }
}

class UiPage extends StatelessWidget {
  const UiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
          title: const Text(MyApp._title), backgroundColor: Colors.orange),
      body: Column(
        children: [
          const SizedBox(height: 40),
          Container(
            child: const CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
              ),
            ),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(),
          ),
          const SizedBox(height: 30),
          const Center(
            child: Text(
              "welcome To Gallery App",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.grey;
                  }
                  return Colors.orange; // Use the component's default.
                },
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            child: const Text(
              "Open my Gallery",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
