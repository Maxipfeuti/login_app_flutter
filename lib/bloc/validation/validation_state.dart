part of 'validation_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class ValidationState extends Equatable {
  final FormStatus formStatus;
  final bool isValid;
  final Username nombre;
  final Email email;
  final Password password;

  const ValidationState({
    this.formStatus = FormStatus.invalid, 
    this.isValid = false,
    this.nombre = const Username.pure(), 
    this.email = const Email.pure(), 
    this.password = const Password.pure(),
  });

  ValidationState copyWith({
    FormStatus? formStatus,
    bool? isValid,
    Username? nombre,
    Email? email,
    Password? password,
  }) => ValidationState(
    formStatus: formStatus ?? this.formStatus,
    isValid: isValid ?? this.isValid,
    nombre: nombre ?? this.nombre,
    email: email ?? this.email,
    password: password ?? this.password,
  );

  @override
  List<Object> get props => [ formStatus, isValid, nombre, email, password ];
}

