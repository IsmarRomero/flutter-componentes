import 'package:flutter/material.dart';
import 'dart:async';

class ListViewPage extends StatefulWidget {
  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  ScrollController _scrollController = new ScrollController();
  List<int> _numeros = new List();
  int _ultimoItem = 0;
  bool _isLoading = false; 
  @override
  void initState() {
    super.initState();
    _agregarDiezImagenes();
    _scrollController.addListener(
       () {
         if ( _scrollController.position.pixels == 
              _scrollController.position.maxScrollExtent) {
                _fetchData();
                // _agregarDiezImagenes();
             }
       }
    );
  }
  
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Stack(children: <Widget>[
        _crearLista(),
        _crearLoading()
      ],)
    );
  }
  Widget _crearLista() {
    return RefreshIndicator (
          child: ListView.builder(
        controller: _scrollController,
        itemBuilder: (context, index) {
          final imagen = _numeros[index];
          return FadeInImage(
            placeholder: AssetImage('assets/original.gif'),
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen')
            );
        },
        itemCount: _numeros.length,
        ),
        onRefresh: obtenerPagina1,
    );
  }
  Future obtenerPagina1() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, (){
      _numeros.clear();
      _ultimoItem++;
      _agregarDiezImagenes();
    });
    return Future.delayed(duration);
  }
  void _agregarDiezImagenes(){
    for (var i = 0; i < 10 ; i++) {
      _ultimoItem++;
      _numeros.add(_ultimoItem);
    }
    setState(() {
       
    });
  }

  Future<Null> _fetchData() async {
    _isLoading = true; 
    setState(() {
      
    });
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHttp);
  }
  void respuestaHttp() {
    _isLoading = false;
    _agregarDiezImagenes();
    _scrollController.animateTo(
      _scrollController.position.pixels + 150,
     duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator()
          ),
          SizedBox(height: 20.0)
        ],
      );
    } else {
      return Container();
    }
  }
} 