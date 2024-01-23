import 'package:domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:travlr/core/validators/email.dart';
import 'package:travlr/core/validators/password.dart';

part 'sign_in_form_state.dart';

class SignInFormCubit extends Cubit<SignInFormState> {
  SignInFormCubit(
    this._authRepository,
  ) : super(const SignInFormState());

  final AuthRepository _authRepository;

  void onEmailChanged(String value) {
    final input = EmailInput.dirty(value);
    emit(state.copyWith(email: input));
  }

  void onPasswordChanged(String value) {
    final input = PasswordInput.dirty(value);
    emit(state.copyWith(password: input));
  }

  void submit() {
    if (state.isNotValid) {
      return;
    }


    _authRepository.login(state.email.value, state.password.value);
  }
}
