import 'package:flutter/material.dart';
import 'package:travelapp/cubit/auth_cubit.dart';
import 'package:travelapp/cubit/page_cubit.dart';
import 'package:travelapp/shared/theme.dart';
import 'package:travelapp/ui/widgets/costum_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: kRedColor,
              content: Text(state.error),
            ),
          );
        } else if (state is AuthInitial) {
          context.read<PageCubit>().setPage(0);
           Navigator.pushNamedAndRemoveUntil(context, '/sign-in', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Center(
          child: CustomButton(
            title: 'Sign Out',
            onPrassed: () {
              context.read<AuthCubit>().signOut();
            },
            width: 220,
          ),
        );
      },
    );
  }
}
