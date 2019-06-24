// To parse this JSON data, do
//
//     final zonaModel = zonaModelFromJson(jsonString);

import 'dart:convert';

ZonaModel zonaModelFromJson(String str) => ZonaModel.fromJson(json.decode(str));

String zonaModelToJson(ZonaModel data) => json.encode(data.toJson());

class ZonaModel {
    String id;
    int estadoZona;
    String idEmpresa;
    String idSucursal;
    String nombreZona;
    int verfPiso;

    ZonaModel({
        this.id,
        this.estadoZona,
        this.idEmpresa,
        this.idSucursal,
        this.nombreZona,
        this.verfPiso,
    });

    factory ZonaModel.fromJson(Map<String, dynamic> json) => new ZonaModel(
        id: json["id"],
        estadoZona: json["estadoZona"],
        idEmpresa: json["idEmpresa"],
        idSucursal: json["idSucursal"],
        nombreZona: json["nombreZona"],
        verfPiso: json["verfPiso"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "estadoZona": estadoZona,
        "idEmpresa": idEmpresa,
        "idSucursal": idSucursal,
        "nombreZona": nombreZona,
        "verfPiso": verfPiso,
    };
}
