import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    const MaterialApp(home: NotDefteri(), debugShowCheckedModeBanner: false),
  );
}

class NotDefteri extends StatefulWidget {
  const NotDefteri({super.key});

  @override
  State<NotDefteri> createState() => _NotDefteriState();
}

class _NotDefteriState extends State<NotDefteri> {
  final TextEditingController _controller = TextEditingController();
  String _kayitliNot = '';

  @override
  void initState() {
    super.initState();
    _notuYukle(); // uygulama açıldığında kaydedilen notu yükle
  }

  Future<void> _notuYukle() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _kayitliNot = prefs.getString('not') ?? '';
    });
  }

  Future<void> _notuKaydet() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('not', _controller.text);
    setState(() {
      _kayitliNot = _controller.text;
    });
  }

  Future<void> _notuSil() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('not');
    setState(() {
      _kayitliNot = '';
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('📝Not Defteri'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Notunuzu yazın',
                labelStyle: TextStyle(fontSize: 16, color: Colors.teal),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _notuKaydet,
                  child: const Text('Kaydet'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _notuSil,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text('Sil'),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Kayıtlı Not:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(_kayitliNot),
            ),
          ],
        ),
      ),
    );
  }
}
