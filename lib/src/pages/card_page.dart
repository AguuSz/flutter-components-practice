import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cards"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text("Soy el titulo de esta tarjeta."),
            subtitle: Text(
                "Aqui estamos con la descripcion de la tarjeta que quiero que ustedes vean para tener una idea de lo que les quiero mostrar."),
          ),
          Row(
            children: [
              FlatButton(onPressed: () {}, child: Text("Cancelar")),
              FlatButton(onPressed: () {}, child: Text("Ok"))
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: <Widget>[
          // Nos permite realizar cargas
          FadeInImage(
            image: NetworkImage('https://i.redd.it/eefnls9gw8c51.png'),
            placeholder: AssetImage('data/assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 100),
            height: 300.0,
            fit: BoxFit.cover,
          ),

          // Image(
          //   image: NetworkImage("https://i.redd.it/eefnls9gw8c51.png"),
          // ),
          Container(
              padding: EdgeInsets.all(10.0),
              child: Text("No tengo idea que poner"))
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),
      ),
    );
  }
}
