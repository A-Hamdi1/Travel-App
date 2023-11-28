import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:voyage/menu/drawer.widget.dart';
import 'package:voyage/pages/pays-details.page.dart';

class PaysPage extends StatelessWidget {
  final TextEditingController txt_pays = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Pays'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: txt_pays,
              decoration: InputDecoration(
                prefixIcon: Icon(FontAwesomeIcons.mapLocation,
                    size: 30, color: Colors.blue),
                hintText: "Keyword",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String keyword = txt_pays.text;
                _onGetPaysDetails(context, keyword);
              },
              child: Text('Chercher', style: TextStyle(fontSize: 22)),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onGetPaysDetails(BuildContext context, String keyword) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaysDetailsPage(keyword),
      ),
    );
  }
}
