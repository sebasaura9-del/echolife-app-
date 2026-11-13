import 'package:flutter/material.dart';

void main() {
  runApp(const EchoLifeApp());
}

class EchoLifeApp extends StatelessWidget {
  const EchoLifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EchoLife',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFF121212),
      ),
      home: const EchoHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EchoHome extends StatefulWidget {
  const EchoHome({super.key});

  @override
  State<EchoHome> createState() => _EchoHomeState();
}

class _EchoHomeState extends State<EchoHome> {
  final List> _capsules = [];
  final TextEditingController _memoryController = TextEditingController();

  void _addCapsule() {
    if (_memoryController.text.isNotEmpty) {
      setState(() {
        _capsules.add({
          'text': _memoryController.text,
          'date': DateTime.now().toString().substring(0, 16),
        });
        _memoryController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EchoLife 🌌 Hissiyotlar Arxivi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _memoryController,
              decoration: InputDecoration(
                labelText: 'Hozirgi hissiyotingiz yoki xotirangizni yozing...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: const Color(0xFF1E1E1E),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: _addCapsule,
              icon: const Icon(Icons.lock_outline),
              label: const Text('Hissiyot Kapsulasini Saqlash'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sizning Kapsulalaringiz:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemCount: _capsules.length,
                itemBuilder: (context, index) {
                  final item = _capsules[index];
                  return Card(
                    color: const Color(0xFF1E1E1E),
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.favorite, color: Colors.tealAccent),
                      title: Text(item['text']!),
                      subtitle: Text(item['date']!, style: const TextStyle(color: Colors.grey)),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
