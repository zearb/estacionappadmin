import 'package:estacionapp/models/empresa_model.dart';
import 'package:estacionapp/providers/EmpresaProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:estacionapp/models/Espacio_model.dart';
import 'package:estacionapp/providers/EspacioProvider.dart';
       
          

  final espacioProvider = new EspacioProvider();
  final empresaProvider = new EmpresaProvider();

class EspacioPage extends StatefulWidget {
  

  @override
  _EspacioPageState createState() => _EspacioPageState();
}

class _EspacioPageState extends State<EspacioPage> {

    // Icon noDisponible = Icon(Icons.remove_circle_outline,color: Colors.blueAccent,);
    // Icon disponible = Icon(Icons.add_circle_outline,color: Colors.blueAccent,);
    Icon icon = Icon(Icons.remove_circle_outline,color: Colors.blueAccent,);

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
        child: _listaEspacios(context)
      )
        );

  }

    Widget _nombreEmpresa() {

    return FutureBuilder(
      future: empresaProvider.cargarEmpresa(),
      builder: (BuildContext context,AsyncSnapshot<List<EmpresaModel>> snapshot){
        if(snapshot.hasData){

          final empresa = snapshot.data;
          
          return Text('${empresa[0].nomEmpresa} - Gestionar:');
        }else{
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
    
    // return 
  }


   Widget _listaEspacios(BuildContext context) {

    
    final String idZona = ModalRoute.of(context).settings.arguments;
    
    return FutureBuilder(
      future: espacioProvider.cargarEspacio(idZona),
      builder: (BuildContext context,AsyncSnapshot<List<EspacioModel>> snapshot){

  
        if(snapshot.hasData){



          final espacio = snapshot.data;
          
          // if(sede.where((f)=>f.idEmpresa()));

          return ListView.builder(
            itemCount: espacio.length,
            itemBuilder: (context,i) => _crearItemEspacio(context,espacio[i]),
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }

    );

  }



   Widget _crearItemEspacio(BuildContext context,EspacioModel espacio){  

    return Card(
      color: Color.fromRGBO(73, 73, 81, 1),
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding: EdgeInsets.all(20.0),
            onTap: (){
                if(espacio.estadoEspacio == 1){

                  setState(() {                    
                    icon = Icon(Icons.add_circle_outline,color: Colors.blueAccent,);
                    espacio.estadoEspacio = 0;    
                  });                 
                  espacioProvider.editarEstadoEspacio(espacio);
                }else{
                  setState(() {                    
                    icon = Icon(Icons.remove_circle_outline,color: Colors.blueAccent,);
                    espacio.estadoEspacio = 1; 
                  });     
                  espacioProvider.editarEstadoEspacio(espacio);
                }
            },
            leading: icon,
            title: Text('${espacio.nomEspacio}',style: TextStyle(color: Colors.white, fontSize:25.0),),
            subtitle: Text('Estado: ${espacio.estadoEspacio}',style: TextStyle(color: Colors.white,fontSize: 15.0),textAlign: TextAlign.end,),
            
          ),
        ],
        ),
    );


  }






}

