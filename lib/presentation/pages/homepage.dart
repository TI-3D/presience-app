import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presience_app/presentation/blocs/auth/auth_bloc.dart';

import '../utils/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          loginSuccess: (data) {
            return Scaffold(
              backgroundColor: neutralTheme,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.user!.name!),
                    Text(data.user!.nim!),
                    Text(data.user!.major!),
                    Text(data.user!.gender!),
                    Text(data.user!.birthDate!),
                    Text(data.user!.isVerified!.toString()),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
