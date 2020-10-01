import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _pesquisa;
  int _quantade = 0;

  @override
  void initState() {
    super.initState();
    _getGIFs().then((value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            "https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquisar..",
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder()),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, color: Colors.white),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _getGIFs(),
              // ignore: missing_return
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        strokeWidth: 5.0,
                      ),
                    );
                  default:
                    if (snapshot.hasError)
                      return Container();
                    else
                      return _criarTabelaGIFs(context, snapshot);
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _criarTabelaGIFs(BuildContext context, AsyncSnapshot snapshot) {
    return Container();
  }

  Future<Map> _getGIFs() async {
    final String melhoresGIFs =
        "https://api.giphy.com/v1/gifs/trending?api_key=4NhMNahVyFR888LczkllWFi9T485CZKA&limit=20&rating=g";
    final String PesuisaGIFs =
        "https://api.giphy.com/v1/gifs/search?api_key=4NhMNahVyFR888LczkllWFi9T485CZKA&q=$_pesquisa&limit=20&offset=$_quantade&rating=g&lang=pt";
    http.Response response;

    if (_pesquisa == null) {
      response = await http.get(melhoresGIFs);
    } else {
      response = await http.get(PesuisaGIFs);
    }
    return json.decode(response.body);
  }
}
