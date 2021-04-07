import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:viaje_express_app/models/ruta.dart';

class RutasProvider{
   String _url = 'http://192.168.1.4:59454/Ruta';
   Future <List<Ruta>> getRutas()async{
    final url=_url;
    final resp=await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);
    final List<Ruta> rutas=[];
    if(decodedData==null) return[];
    decodedData.forEach((key) { 
      final ruta=Ruta.fromJson(key);
      rutas.add(ruta);
    });
    return rutas;
  }
}
