import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: ProfilSayfasi()),
  );
}

class ProfilSayfasi extends StatelessWidget {
  const ProfilSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        backgroundColor: Colors.purple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profil Fotoğrafı
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                ),
                const SizedBox(height: 16),

                // Ad Soyad
                const Text(
                  'Nazlı Hanım Keleş',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),

                // Hakkımda
                const Text(
                  'Merhaba! Ben Nazlı, mobil uygulama geliştirme ile ilgileniyorum. Flutter ile modern ve güzel arayüzler geliştirmekten keyif alıyorum.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 24),

                // İkonlar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.phone, size: 32, color: Colors.purple),
                    Icon(Icons.email, size: 32, color: Colors.purple),
                    Icon(Icons.link, size: 32, color: Colors.purple),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
