import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/cubit/auth_cubit.dart';
import 'package:cocktail_project/data/repositories/auth_repository.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constant_text.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthRepository authRepository = AuthRepository();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await authRepository.signUp(email: _email.text, password: _password.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        AutoRouter.of(context)
                            .popUntilRouteWithName(LoginRoute.name);
                      },
                      iconSize: 35,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        invertColors: true,
                        image: AssetImage(
                          'images/2.jpg',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  style: ConstantText.titleTextStyle,
                  validator: (value) {
                    return RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)
                        ? null
                        : "Please Enter A Valid Email";
                  },
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: ConstantText.tagText,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.length < 6) {
                      return "Password must be at least 6 characters";
                    } else {
                      return null;
                    }
                  },
                  controller: _password,
                  style: ConstantText.titleTextStyle,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: ConstantText.tagText,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade700),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();

                        await context.read<AuthCubit>().signUp(
                            email: _email.text,
                            password: _password.text,
                            context: context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade800),
                    child: BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        if (state is AuthLoading) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(
                              child:
                                  CircularProgressIndicator(color: Colors.grey),
                            ),
                          );
                        }
                        return Text(
                          'Register',
                          style: ConstantText.titleTextStyle,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
