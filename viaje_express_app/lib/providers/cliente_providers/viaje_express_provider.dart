import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:viaje_express_app/models/solicitud_cliente.dart';

class ViajeProvider{
  String _url = 'http://192.168.1.4:59454/SolicitudCliente';
  Future<SolicitudCliente> crearSolicitudViaje(SolicitudCliente solicitudCliente)async{
    solicitudCliente.solicitudClienteId=0;
    final url=_url;
    final resp=await http.post(url,
    body: solicitudClienteToJson(solicitudCliente),
    headers: {
      'Content-type': 'application/json'
    }
    );
    final decodeData = json.decode(resp.body);
   
    return SolicitudCliente.fromJson(decodeData);
  }
  Future <List<SolicitudCliente>> getSolicitudes(int idpersonaRol)async{
    final url=_url+'/'+idpersonaRol.toString();
    final resp=await http.get(url);
    final List<dynamic> decodedData = json.decode(resp.body);
    final List<SolicitudCliente> solicitudes=[];
    if(decodedData==null) return[];
    decodedData.forEach((key) { 
      final sol=SolicitudCliente.fromJson(key);
      solicitudes.add(sol);
    });
    return solicitudes;
  }

   
}