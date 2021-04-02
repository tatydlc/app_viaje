import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.idPersona,   
        this.createdBy,  
        this.personaNombreUsuario,           
        this.personaRolId,
        this.rolId
    });

    int idPersona; 
    int createdBy; 
    String personaNombreUsuario;
    int personaRolId;
    int rolId;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        idPersona: json["idPersona"], 
        createdBy: json["createdBy"],     
        personaNombreUsuario: json["personaNombreUsuario"],
        personaRolId:json["personaRolId"],
        rolId:json["rolId"]
    );

    Map<String, dynamic> toJson() => {
      'idUsuario': idPersona,
      'nombreUsuario': personaNombreUsuario,
      'personaRolId':personaRolId,
      'rolId':rolId,
      'createdBy':createdBy
    };
}