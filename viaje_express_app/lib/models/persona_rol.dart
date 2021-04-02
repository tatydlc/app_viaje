// To parse this JSON data, do
//
//     final personaRol = personaRolFromJson(jsonString);

import 'dart:convert';

PersonaRol personaRolFromJson(String str) => PersonaRol.fromJson(json.decode(str));

String personaRolToJson(PersonaRol data) => json.encode(data.toJson());

class PersonaRol {
    PersonaRol({
        this.personaRolId,
        this.personaId,
        this.rolId,
        this.estadoPersonaId,
        this.createdBy,

    });

    int personaRolId;
    int personaId;
    int rolId;
    int estadoPersonaId;
    int createdBy;

    factory PersonaRol.fromJson(Map<String, dynamic> json) => PersonaRol(
        personaRolId: json["personaRolId"],
        personaId: json["personaId"],
        rolId: json["rolId"],
        estadoPersonaId: json["estadoPersonaId"],
        createdBy: json["createdBy"],
    );

    Map<String, dynamic> toJson() => {
        "personaRolId": personaRolId,
        "personaId": personaId,
        "rolId": rolId,
        "estadoPersonaId": estadoPersonaId,
        "createdBy": createdBy,
    };
}