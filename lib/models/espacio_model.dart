// To parse this JSON data, do
//
//     final espacioModel = espacioModelFromJson(jsonString);

import 'dart:convert';

EspacioModel espacioModelFromJson(String str) => EspacioModel.fromJson(json.decode(str));

String espacioModelToJson(EspacioModel data) => json.encode(data.toJson());

class EspacioModel {
    String id;
    int estadoEspacio;
    String idPiso;
    String nomEspacio;

    EspacioModel({
        this.id,
        this.estadoEspacio,
        this.idPiso,
        this.nomEspacio,
    });

    factory EspacioModel.fromJson(Map<String, dynamic> json) => new EspacioModel(
        id: json["id"],
        estadoEspacio: json["estadoEspacio"],
        idPiso: json["idPiso"],
        nomEspacio: json["nomEspacio"],
    );

    Map<String, dynamic> toJson() => {
        // "id": id,
        "estadoEspacio": estadoEspacio,
        "idPiso": idPiso,
        "nomEspacio": nomEspacio,
    };
}
