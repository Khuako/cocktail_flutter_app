import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/cubit/auth_cubit.dart';
import 'package:cocktail_project/data/repositories/auth_repository.dart';
import 'package:cocktail_project/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        child: Text('Sign out'),
        onPressed: () async {
          await context.read<AuthCubit>().signOut();
          AutoRouter.of(context).pushAndPopUntil(
              LoginRoute(
                onResult: (success) => null,
              ),
              predicate: (_) => false);
        },
      ),
    );
  }
}
