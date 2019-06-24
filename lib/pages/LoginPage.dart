import 'package:estacionapp/Bloc/LoginBloc.dart';
import 'package:estacionapp/Bloc/provider.dart';
import 'package:estacionapp/providers/UsuarioProvider.dart';
import 'package:estacionapp/utils/utils.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatelessWidget {
  // const LoginPage({Key key}) : super(key: key);

  final usuarioProvider = new UsuarioProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(73, 101, 113, 1.0),
      body: Stack(

        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
        ),
    );
  }


  Widget _loginForm(BuildContext context){

    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size; 

    

    return SingleChildScrollView(
      child: Column(

        children: <Widget>[

          SafeArea(
            child: Container(
              height: 140.0
              ,),
          ),

          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0),
            margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0.0,2.0 ),
                  // spreadRadius: 3.0
                )
              ]
              ),
            child: Column(children: <Widget>[
              Text('Login',style:TextStyle(fontSize: 20.0)),
              SizedBox(height: 30.0,),
              _crearEmail(bloc),
              SizedBox(height: 30.0,),
              _crearClave(bloc),
              SizedBox(height: 30.0,),
              _crearBoton(bloc),
              ],
            ),
          )
        ],
        
      ),
    );
  }

  Widget _crearEmail(LoginBloc bloc){


    return StreamBuilder(
      stream: bloc.emailStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration:InputDecoration(
              icon: Icon(Icons.alternate_email,color:Colors.black54),
              hintText: 'ejemplo@correo.com',
              labelText: 'Usuario',
              counterText: snapshot.data,
              errorText: snapshot.error
              
            ) , 
            onChanged:(value) => bloc.changeEmail(value),
          ),
        );
      },
    );

    
  }

    Widget _crearClave(LoginBloc bloc){

      return StreamBuilder(
        stream: bloc.passwordStream ,
        builder: (BuildContext context, AsyncSnapshot snapshot){
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                  decoration:InputDecoration(
                    icon: Icon(Icons.lock_outline,color:Colors.black54),
                    labelText: 'Contraseña',
                    counterText: snapshot.data,
                    errorText: snapshot.error,
                  ) , 
                  onChanged: bloc.changePassword,
                ),
              );
        },
      );


  }

  Widget _crearBoton(LoginBloc bloc){

    return StreamBuilder(
      stream: bloc.formValidStream ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        return RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Color                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          .fromRGBO(44,62,80,1.0),
          textColor: Colors.white,
          child: Container(
            child: Text('Ingresar'),
          ), 
          onPressed: snapshot.hasData ? ()=>_login(bloc,context) : null,
        );
      },
    );
  }

  _login(LoginBloc bloc,BuildContext context) async{
    
    Map info = await usuarioProvider.login(bloc.email, bloc.pass);

    if(info['ok']){
      mostrarAlerta(context,info['Bienvenido']);
      Navigator.pushReplacementNamed(context, "home");
    }else{
      mostrarAlerta(context,info['mensaje']);
    }

  }

  Widget _crearFondo(BuildContext context){
    
    final size = MediaQuery.of(context).size;
    
    final fondoOscuro = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(73, 101, 113, 1.0),
            Color.fromRGBO(73, 101, 113, 1.0)
          ] )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );


    return Stack(
      children: <Widget>[
        fondoOscuro,
        Positioned(child: circulo, top: 90.0, left: 30.0),
        Positioned(child: circulo, top: -40.0, right: -30.0),
        Positioned(child: circulo, bottom: -50.0, right: -10.0),
        Positioned(child: circulo, bottom: 120.0, right: 20.0),
        Positioned(child: circulo, bottom: -50.0, left: -20.0),

        Container(
          padding: EdgeInsets.only(top: 40.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle,color: Colors.white, size: 100.0),
              SizedBox(height: 10.0, width: double.infinity,),
              Text('EstacionApp',style: TextStyle(color: Colors.white,fontSize: 20.0),)
            ],
            ),
          )
      ],
    );


  }

}