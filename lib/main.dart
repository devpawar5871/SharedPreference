import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controller = TextEditingController();
  String savedData = "";

  // Save Data
  void saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('mydata', controller.text);

    setState(() {
      savedData = controller.text;
    });
  }

  // Get Data
  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('mydata');

    setState(() {
      savedData = data ?? "No Data Found";
    });
  }

  // Delete Data
  void deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('mydata');

    setState(() {
      savedData = "Data Deleted";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences Demo"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Enter Data",
              ),
            ),

            const SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: saveData,
                  child: const Text("Save"),
                ),
                ElevatedButton(
                  onPressed: getData,
                  child: const Text("Get"),
                ),
                ElevatedButton(
                  onPressed: deleteData,
                  child: const Text("Delete"),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Display Data
            const Text(
              "Stored Data:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(
              savedData,
              style: const TextStyle(fontSize: 16, color: Colors.blue),
            ),

            const Spacer(), // pushes footer to bottom

            // ✅ Footer
            const Text(
              "Created by Dev Pawar",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}