import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componentes TEMP"),
      ),
      body: 
        // ListView(children: _crearItems())
        ListView(children: _crearItemsCorta())
      ,
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();

    for (var opt in opciones) {
      final tempWidget = ListTile(title: Text(opt));

      lista.add(tempWidget);
      lista.add(Divider());

      // Es lo mismo que lo de arriba
      // lista..add(tempWidget)
      //      ..add(Divider());
    }

    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((item) {
      return Column(
        children: [
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("Cualquier cosa"),
            leading: Icon(Icons.account_balance_wallet_rounded),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
