import 'package:flutter/material.dart';

void main() {
  //runApp -> inicializa a aplicação;
  //MeterialApp -> Informa que o widget é do tipo material design
  //title -> Representa o titulo do aplicativo
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  //forma de criar um stateful
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _infoText = "Pode Entrar!";

  void changePeople(int delta) {
    //forma de avisar que teve alteração na tela e atualizar;
    setState(() {
      _people += delta;

      if (_people < 0) {
        _infoText = "Mundo invertido?!";
      } else if (_people <= 10) {
        _infoText = "Pode entrar!";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  //forma de criar um stateless
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //centralizando o conteúdo
          children: <Widget>[
            Text(
              "Pessoas: $_people",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text("+1",
                          style:
                              TextStyle(color: Colors.white, fontSize: 40.0)),
                      onPressed: () {
                        changePeople(1);
                      }),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: FlatButton(
                      child: Text("-1",
                          style:
                              TextStyle(color: Colors.white, fontSize: 40.0)),
                      onPressed: () {
                        changePeople(-1);
                      }),
                )
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            )
          ],
        )
      ],
    );
  }
}
