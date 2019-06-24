import 'dart:convert';

EmpresaModel empresaModelFromJson(String str) => EmpresaModel.fromJson(json.decode(str));

String empresaModelToJson(EmpresaModel data) => json.encode(data.toJson());

class EmpresaModel {
    String id;
    String admin;
    int estadoEmpresa;
    String imagenUrl;
    String nomEmpresa;
    int verfPiso;
    int verfSucursal;
    int verfZona;

    EmpresaModel({
        this.id,
        this.admin,
        this.estadoEmpresa,
        this.imagenUrl,
        this.nomEmpresa,
        this.verfPiso,
        this.verfSucursal,
        this.verfZona,
    });

    factory EmpresaModel.fromJson(Map<String, dynamic> json) => new EmpresaModel(
        id: json["id"],
        admin: json["admin"],
        estadoEmpresa: json["estadoEmpresa"],
        imagenUrl: json["imagenURL"],
        nomEmpresa: json["nomEmpresa"],
        verfPiso: json["verfPiso"],
        verfSucursal: json["verfSucursal"],
        verfZona: json["verfZona"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "admin": admin,
        "estadoEmpresa": estadoEmpresa,
        "imagenURL": imagenUrl,
        "nomEmpresa": nomEmpresa,
        "verfPiso": verfPiso,
        "verfSucursal": verfSucursal,
        "verfZona": verfZona,
    };
}

