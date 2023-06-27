import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../infraestructure/inputs/inputs.dart';

part 'validation_state.dart';

class ValidationCubit extends Cubit<ValidationState> {
  ValidationCubit() : super(const ValidationState());


    void onSubmit() {
    emit(
      state.copyWith(
        formStatus: FormStatus.validating,
        nombre: Username.dirty( state.nombre.value ),
        password: Password.dirty( state.password.value ),
        email: Email.dirty( state.email.value ),

        isValid: Formz.validate([
          state.nombre, 
          state.password,
          state.email
        ])
      )
    );



    print('Cubit Submit: $state');
  }


  void nombreChanged( String value ) {
    final nombre = Username.dirty(value);
    emit(
      state.copyWith(
        nombre: nombre,
        isValid: Formz.validate([ nombre, state.password, state.email ])
      )
    );
  }

  void emailChanged( String value ) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([ email, state.password, state.nombre ])
      )
    );
  }

  void passwordChanged( String value ) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([ password, state.nombre, state.email ])
      )
    );
  }


}
