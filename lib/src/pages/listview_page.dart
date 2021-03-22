import 'dart:async';

import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;
  // Controlando el scroll
  ScrollController _scrollController = new ScrollController();
  bool _isLoading = false;

  // Ciclo de vida: creacion de un stateful widget
  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      // Controlamos si la posicion en pixeles es igual a la altura maxima
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  // Dispose de la pagina (cuando la pagina es destruida)
  @override
  void dispose() {
    super.dispose();
    // Limpia la memoria del scrollController cuando salgo de la pagina actual.
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Stack(
        children: [_crearLista(context), _crearLoading()],
      ),
    );
  }

  Widget _crearLista(BuildContext context) {
    // Se encarga de renderizar los elementos conforme sea necesario.
    // Se utiliza cuando no sabemos cuantos elementos van a estar contenidos dentro.
    return RefreshIndicator(
      onRefresh: obtenerPagina1,
      child: ListView.builder(
          // Cuantos items voy a tener que mostrar al inicio
          itemCount: _listaNumeros.length,
          // Builder significa como se dibuja este widget
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];

            return FadeInImage(
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
              placeholder: AssetImage('data/assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
            );
          },
          // Esto relaciona el controlador del scroller al listView.builder
          controller: _scrollController),
    );
  }

  Future<Null> obtenerPagina1() async {
    final duration = Duration(seconds: 2);
    new Timer(duration, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });

    return Future.delayed(duration);
  }

  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar10();

    // Moviendo el scroll
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: new Duration(milliseconds: 250));
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}
