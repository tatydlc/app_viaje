import 'dart:convert';

Persona personaFromJson(String str) => Persona.fromJson(json.decode(str));

String personaToJson(Persona data) => json.encode(data.toJson());

class Persona {
    Persona({
        this.idPersona,
        this.cedulaPersona,
        this.nombrePersona,
        this.apellidosPersona,
        this.nacimientoPersona,
        this.telefonoPersona,
        this.direccionPersona,
        this.correoPersona,
        this.contraseniaPersona,     
        this.createdBy,  
        this.personaNombreUsuario,
    });

    int idPersona;
    String cedulaPersona;
    String nombrePersona;
    String apellidosPersona;
    String nacimientoPersona;
    String telefonoPersona;
    String direccionPersona;
    String correoPersona;
    String contraseniaPersona; 
    int createdBy; 
    String personaNombreUsuario;

    factory Persona.fromJson(Map<String, dynamic> json) => Persona(
        idPersona: json["idPersona"],
        cedulaPersona: json["cedulaPersona"],
        nombrePersona: json["nombrePersona"],
        apellidosPersona: json["apellidosPersona"],
        nacimientoPersona: json["nacimientoPersona"],
        telefonoPersona: json["telefonoPersona"],
        direccionPersona: json["direccionPersona"],
        correoPersona: json["correoPersona"],
        contraseniaPersona: json["contraseniaPersona"],    
        createdBy: json["createdBy"],     
        personaNombreUsuario: json["personaNombreUsuario"],
    );

    Map<String, dynamic> toJson() => {
        "idPersona": idPersona,
        "cedulaPersona": cedulaPersona,
        "nombrePersona": nombrePersona,
        "apellidosPersona": apellidosPersona,
        "nacimientoPersona": nacimientoPersona,
        "telefonoPersona": telefonoPersona,
        "direccionPersona": direccionPersona,
        "correoPersona": correoPersona,
        "contraseniaPersona": contraseniaPersona,
        "createdBy": createdBy,  
        "personaNombreUsuario": personaNombreUsuario,
    };
}