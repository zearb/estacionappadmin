import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:estacionapp/Bloc/validator.dart';

class LoginBloc with Validators{

  final _emailController =    BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPass );

  Stream<bool> get formValidStream => 
    Observable.combineLatest2(emailStream, passwordStream, (e,p) => true);

  // Insertar valores al Streamadd
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener el último valor ingresado a los streams
  String get email => _emailController.value;
  String get pass => _passwordController.value;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
  

}