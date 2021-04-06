import 'dart:convert';

SolicitudCliente solicitudClienteFromJson(String str) => SolicitudCliente.fromJson(json.decode(str));

String solicitudClienteToJson(SolicitudCliente data) => json.encode(data.toJson());

class SolicitudCliente {
    SolicitudCliente({
        this.solicitudClienteId,
        this.personaRolId,
        this.tipoSolicitudId,
        this.solicitudClienteSalidaSolCliente,
        this.solicitudClienteDestinoSolCliente,
        this.estadoSolicitudId,
        this.createdBy,
    });

    int solicitudClienteId;
    int personaRolId;
    int tipoSolicitudId;
    String solicitudClienteSalidaSolCliente;
    String solicitudClienteDestinoSolCliente;
    int estadoSolicitudId;
    int createdBy;

    factory SolicitudCliente.fromJson(Map<String, dynamic> json) => SolicitudCliente(
        solicitudClienteId: json["solicitudClienteId"],
        personaRolId: json["personaRolId"],
        tipoSolicitudId: json["tipoSolicitudId"],
        solicitudClienteSalidaSolCliente: json["solicitudClienteSalidaSolCliente"],
        solicitudClienteDestinoSolCliente: json["solicitudClienteDestinoSolCliente"],
        estadoSolicitudId: json["estadoSolicitudId"],
        createdBy: json["createdBy"],
    );

    Map<String, dynamic> toJson() => {
        "solicitudClienteId": solicitudClienteId,
        "personaRolId": personaRolId,
        "tipoSolicitudId": tipoSolicitudId,
        "solicitudClienteSalidaSolCliente": solicitudClienteSalidaSolCliente,
        "solicitudClienteDestinoSolCliente": solicitudClienteDestinoSolCliente,
        "estadoSolicitudId": estadoSolicitudId,
        "createdBy": createdBy,
    };
}
