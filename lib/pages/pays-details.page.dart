import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PaysDetailsPage extends StatefulWidget {
  final String ville;

  PaysDetailsPage(this.ville);

  @override
  State<PaysDetailsPage> createState() => _PaysDetailsPageState();
}

class _PaysDetailsPageState extends State<PaysDetailsPage> {
  bool isLoading = true;
  var paysData;

  @override
  void initState() {
    super.initState();
    getPaysData(widget.ville);
  }

  Future<void> getPaysData(String pays) async {
    final resp = await http.get(Uri.parse('https://restcountries.com/v2/name/$pays'));
    if (resp.statusCode == 200) {
      setState(() {
        paysData = json.decode(utf8.decode(resp.bodyBytes));
        isLoading = false;
      });
    } else {
      throw Exception('Échec de la requête');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Pays-Details'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.network(
              paysData[0]['flags']['png'],
              height: 190,
              width: 800,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            '${widget.ville}\n${paysData[0]['nativeName']}',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),


          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Administaration',
                style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              buildInfo('Capitale :', paysData[0]['capital']),
              buildInfo(
                'Language(s) :',
                '${paysData[0]['languages'][0]['name']} , ${paysData[0]['languages'][0]['nativeName']}',
              ),
              const SizedBox(height: 20),
              const Text(
                'Géographie',
                style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              buildInfo('Région :', paysData[0]['region']),
              buildInfo('Superficie :', paysData[0]['area'].toString()),
              buildInfo('Fuseau Horaire :', paysData[0]['timezones'][0]),
              const SizedBox(height: 20),
              const Text(
                'Démographie',
                style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 20),
              ),
              buildInfo('Population :', paysData[0]['population'].toString()),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildInfo(String s, String v) {
    return Row(
      children: [
        Text(s, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 20, height: 30),
        Text(v),
      ],
    );
  }
}
