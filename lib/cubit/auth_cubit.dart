// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:bloc/bloc.dart';
import 'package:cocktail_project/widgets/snack_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../data/repositories/auth_repository.dart';
import '../routes/routes.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepository authRepository = AuthRepository();
  late String email;
  Future signUp(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(AuthLoading());
    try {
      await authRepository.signUp(email: email, password: password);
      AutoRouter.of(context).pushAndPopUntil(
          LoginRoute(
            onResult: (success) => null,
          ),
          predicate: (_) => false);

      emit(AuthSignedIn());
    } catch (e) {
      emit(AuthSignedOut());
      showSnackBar(context, Colors.red, e.toString());
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  Future signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(AuthLoading());
    try {
      await authRepository.signIn(email: email, password: password);
      AutoRouter.of(context)
          .pushAndPopUntil(const MainRoute(), predicate: (_) => false);
      emit(AuthSignedIn());
      email = email;
    } catch (e) {
      emit(AuthSignedOut());
      showSnackBar(context, Colors.red, e.toString());
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void getUserEmail() {
    email =  authRepository.firebaseAuth.currentUser!.email!;
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
