import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../data/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepository authRepository = AuthRepository();
  Future signUp({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(email: email, password: password);
      emit(AuthSignedIn());
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  Future signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      await authRepository.signIn(email, password);
      emit(AuthSignedIn());
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // bool isLoggedIn() {
  //   final result = authRepository.isLoggedIn();
  //   if (result == true) {
  //     emit(AuthSignedIn());
  //   } else {
  //     emit(AuthSignedOut());
  //   }
  //   return isLoggedIn();
  // }

  Future<void> signOut() async {
    await authRepository.signOut();
    emit(AuthSignedOut());
  }
}
