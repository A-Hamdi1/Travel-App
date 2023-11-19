import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(AuthentificationApp());

class AuthentificationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthentificationPage(),
    );
  }
}

class AuthentificationPage extends StatelessWidget {
  TextEditingController txt_login = TextEditingController();
  TextEditingController txt_password = TextEditingController();
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Authentification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: txt_login,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Utilisateur",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Espace entre les champs de texte
            TextFormField(
              controller: txt_password,
              obscureText: true, // Pour masquer le texte du mot de passe
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: "Mot de passe",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16.0), // Espace entre les champs de texte
            ElevatedButton(
              onPressed: () {
                // Ajoutez ici la logique pour gérer la connexion
                String username = txt_login.text;
                String password = txt_password.text;
                // Faites quelque chose avec les données de connexion
                _onAuthentifier(context);
              },
              child: Text('Connexion', style: TextStyle(fontSize: 22)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
            TextButton(
                child:
                Text("Nouvel Utilisateur", style: TextStyle(fontSize: 22)),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/inscription');
                }),
          ],
        ),
      ),
    );
  }

  Future<void> _onAuthentifier(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    if (!txt_login.text.isEmpty && !txt_password.text.isEmpty) {
      String log = prefs.getString("login") ?? '';
      String psw = prefs.getString("password") ?? '';
      print(txt_password.text);
      if (txt_login.text == log && txt_password.text == psw) {
        prefs.setBool("connecte", true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } else {
        const snackBar = SnackBar(
          content: Text('Vérifier votre Id et mot de passe'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}