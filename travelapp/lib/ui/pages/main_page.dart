import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/page_cubit.dart';
import 'package:travelapp/ui/pages/home_page.dart';
import 'package:travelapp/ui/pages/settings_page.dart';
import 'package:travelapp/ui/pages/transaction_page.dart';
import 'package:travelapp/ui/pages/wallet_page.dart';
import 'package:travelapp/ui/widgets/custom_bottom_navigation_bar.dart';
import '../../shared/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    Widget customBottomNavigationBar() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.only(
            bottom: 30,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: kWhiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              BottomNavigationItem(
                index: 0,
                imageUrl: 'assets/icon_home.png',
              ),
              BottomNavigationItem(
                index: 1,
                imageUrl: 'assets/icon_booking.png',
                
              ),
              BottomNavigationItem(
                index: 2,
                imageUrl: 'assets/icon_card.png',
              ),
              BottomNavigationItem(
                index: 3,
                imageUrl: 'assets/icon_settings.png',
              ),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNavigationBar(),
            ],
          ),
        );
      },
    );
  }
}
