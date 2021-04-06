import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:viaje_express_app/models/persona.dart';
import 'package:viaje_express_app/models/persona_rol.dart';
import 'package:viaje_express_app/providers/login_registro_providers/persona_rol_provider.dart';

class PersonaProvider {
  String _url = 'http://192.168.1.4:59454/Persona';
  Persona personaid= new Persona();
  PersonaRol personaRol= new PersonaRol();
  final personaRolProvider= new PersonaRolProvider();
  Future<Persona> crearPersona(Persona persona)async{
    personaid.idPersona=0;
    final url=_url;
    final resp=await http.post(url,
    body: personaToJson(persona),
    headers: {
      'Content-type': 'application/json'
    }
    );
    final decodeData = json.decode(resp.body);
    personaid.idPersona=Persona.fromJson(decodeData).idPersona;
     personaRol.personaRolId=0;
      personaRol.createdBy=0;
      personaRol.estadoPersonaId=1;
      personaRol.rolId=7;
      personaRol.personaId=personaid.idPersona;  
     // personaRol.personaId=persona.idPersona;    
      print('vista ${personaRol.personaId}');
      personaRolProvider.crearPersonaRol(personaRol);
    return Persona.fromJson(decodeData);
  }
   Future<Map<String,dynamic>> loginUsuario (Persona persona)async{
    final url=_url;
   
    final resp=await http.get(url+'/'+persona.personaNombreUsuario+'/'+persona.contraseniaPersona );
    if(resp.body==""){
      return null;
    }else if(resp.statusCode==200){
      print(resp.statusCode);
      final decodeData = json.decode(resp.body);
      Map personaRolMap=await personaRolProvider.getPersonaRol(decodeData['idPersona']);
      
      final map ={
      'idUsuario':decodeData['idPersona'],
      'personaNombreUsuario':decodeData['personaNombreUsuario'],
      'personaRolId':personaRolMap['personaRolId'],
      'rolId':personaRolMap['rolId'],
      'createdBy':decodeData['createdBy']
      };
      //personaRolProvider.getPersonaRol(decodeData['idPersona']);
      return map;
    } 
   }
}
