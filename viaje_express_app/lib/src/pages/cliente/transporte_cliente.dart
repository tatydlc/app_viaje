import 'package:flutter/material.dart';
class TransportePage extends StatefulWidget {
 

  @override
  _TransportePageState createState() => _TransportePageState();
}

class _TransportePageState extends State<TransportePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         title: Text('Solicitud transporte')
       )
    );
  }
}