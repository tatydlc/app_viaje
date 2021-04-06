import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:viaje_express_app/models/persona_rol.dart';


class PersonaRolProvider {
  String _url = 'http://192.168.1.4:59454/PersonaRol';
 

  Future<bool> crearPersonaRol(PersonaRol personaRol)async{
    final url=_url;
    final resp=await http.post(url,
    body: personaRolToJson(personaRol),
    headers: {
      'Content-type': 'application/json'
    }
    );
    final decodeData = json.decode(resp.body);
    print (decodeData);
    
    return true; 
  }
   Future<Map<String,dynamic>> getPersonaRol(int personaId)async{
    final url=_url;
    final resp=await http.get(url+'/'+personaId.toString());
    final  decodeData = json.decode(resp.body);
    final  personaRolMap={
      'personaRolId':decodeData['personaRolId'],
      'rolId':decodeData['rolId']
    };
   
    return personaRolMap;
  }
}