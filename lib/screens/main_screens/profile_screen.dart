// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:cocktail_project/constants/constant_text.dart';
import 'package:cocktail_project/cubit/auth_cubit.dart';

import 'package:cocktail_project/routes/routes.dart';
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
  void initState() {
    super.initState();
    context.read<AuthCubit>().getUserEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.person,
            size: 200,
            color: Colors.white24,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Email: ${context.watch<AuthCubit>().email}',
            style: ConstantText.titleTextStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.white30),
            child: const Text(
              'Sign out',
            ),
            onPressed: () async {
              await context.read<AuthCubit>().signOut();
              AutoRouter.of(context).pushAndPopUntil(
                  LoginRoute(
                    onResult: (success) => null,
                  ),
                  predicate: (_) => false);
            },
          ),
        ],
      ),
    );
  }
}
