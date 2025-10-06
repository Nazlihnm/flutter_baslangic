import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'AlanSans'),
      title: 'Flutter Widget Antrenmanı',
      debugShowCheckedModeBanner: false,
      home: const WidgetAntrenmani(),
    );
  }
}

class WidgetAntrenmani extends StatefulWidget {
  const WidgetAntrenmani({super.key});

  @override
  State<WidgetAntrenmani> createState() => _WidgetAntrenmaniState();
}

class _WidgetAntrenmaniState extends State<WidgetAntrenmani> {
  Color _arkaPlanRengi = Colors.white;
  bool _morMu = false;

  void _rengiDegistir() {
    setState(() {
      _morMu = !_morMu;
      _arkaPlanRengi = _morMu ? Colors.deepPurple : Colors.indigo;
    });
  }

  void _mesajGoster(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Merhaba Flutter 🚀'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _arkaPlanRengi,
      appBar: AppBar(
        title: const Text('Flutter Widget Antrenmanı'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hoş Geldin Flutter!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Resim (Network örneği)
            Image.asset('assets/fonts/images/logo.png', width: 200),
            const SizedBox(height: 30),
            // ElevatedButton
            ElevatedButton(
              onPressed: _rengiDegistir,
              child: const Text('Arka plan rengini değiştir'),
            ),
            const SizedBox(height: 15),
            // IconButton
            IconButton(
              icon: const Icon(Icons.message, size: 32, color: Colors.black87),
              onPressed: () => _mesajGoster(context),
            ),
          ],
        ),
      ),
    );
  }
}
