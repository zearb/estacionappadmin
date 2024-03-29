import 'package:estacionapp/models/empresa_model.dart';
import 'package:estacionapp/models/sede_model.dart';
import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:estacionapp/providers/SedeProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget{

  
  final empresaProvider = new EmpresaProvider();
  final sedeProvider = new SedeProvider();

  @override
  Widget build(BuildContext context) {


    Color color1 = Color.fromRGBO(249, 170, 51, 1);
    Color color2 = Color.fromRGBO(73, 101, 113, 1);


    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.directions_car,size: 45.0,)
          ),
        title: _nombreEmpresa(),
        backgroundColor: color1,
      ),
      body: Container(
        color: color2,
        padding: EdgeInsets.all(10.0),
        child: _listaSedes()
      )
        );
    }

  Widget _nombreEmpresa() {


    return FutureBuilder(
      future: empresaProvider.cargarEmpresa(),
      builder: (BuildContext context,AsyncSnapshot<List<EmpresaModel>> snapshot){
        if(snapshot.hasData){

          final empresa = snapshot.data;
          
          return Text('${empresa[0].nomEmpresa} - Seleccione la sede:');
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
    
    // return 
  }

  Widget _listaSedes() {
    
    return FutureBuilder(
      future: sedeProvider.cargarSede(),
      builder: (BuildContext context,AsyncSnapshot<List<SedeModel>> snapshot){
          
        if(snapshot.hasData){

          final sede = snapshot.data;
          
          // if(sede.where((f)=>f.idEmpresa()));

          return ListView.builder(
            itemCount: sede.length,
            itemBuilder: (context,i) => _crearItemSede(context,sede[i]),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }

    );

  }


  Widget _crearItemSede(BuildContext context,SedeModel sede){
    
    return Card(
      color: Color.fromRGBO(73, 73, 81, 1),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20.0),
            leading: Icon(Icons.location_on,color: Colors.blueAccent,),
            title: Text('${sede.distrito}',style: TextStyle(color: Colors.white, fontSize:25.0),),
                  subtitle: Text('${sede.direccion}',style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.end,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(
                child: Text('Gestionar'),
                onPressed: ()=>Navigator.pushNamed(context, 'zona',arguments: sede.id),
              )
            ],
          )
        ],
        ),
    );


  }


       }
          
