import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perfil',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 64.0,
                backgroundImage: AssetImage(
                    'assets/profile_picture.jpg'), // Substitua pelo caminho da imagem da foto do usuário
              ),
              SizedBox(height: 16.0),
              Text(
                'Nome do Usuário',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Email do Usuário',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              TextButton(
                child: Text(
                  'Alterar Informações Pessoais',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  // Lógica para abrir a tela de edição de informações pessoais
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text(
                  'Usuário Padrão',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 37, 37, 37)),
                onPressed: null, // Botão inativo
              ),
            ],
          ),
        ),
      ),
    );
  }
}
