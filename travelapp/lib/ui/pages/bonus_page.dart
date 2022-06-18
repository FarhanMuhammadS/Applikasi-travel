import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/auth_cubit.dart';
import 'package:travelapp/ui/widgets/costum_button.dart';
import '../../shared/theme.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bonusCard() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
           if (state is AuthSucces) {
             return Container(
            width: 300,
            height: 211,
            padding: EdgeInsets.all(defaultMargin),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/image_card.png',
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: kPrimaryColor.withOpacity(0.5),
                    blurRadius: 50,
                    offset: Offset(0, 10),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteTextStyle.copyWith(
                              fontWeight: light,
                            ),
                          ),
                          Text(
                             state.user.name,
                            style: whiteTextStyle.copyWith(
                              fontSize: 20,
                              fontWeight: medium,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/icon_plane.png',
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Pay',
                      style: whiteTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 41,
                ),
                Text(
                  'Balance',
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                  ),
                ),
                Text(
                  'IDR 280.000.000',
                  style: whiteTextStyle.copyWith(
                    fontSize: 25,
                    fontWeight: medium,
                  ),
                )
              ],
            ),
          );
           } else {
            return SizedBox();
           }
        },
      );
    }

    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 30),
        child: Text(
          'Big Bonus 🎉',
          style: blackTextStyle.copyWith(
            fontSize: 32,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget subtitle() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        child: Text(
          'We give you early credit so that\nyou can buy a flight ticket',
          style: greyTextStyle.copyWith(
            fontSize: 16,
            fontWeight: light,
          ),
          textAlign: TextAlign.center,
        ),
      );
    }

    Widget startButton() {
      return CustomButton(
          title: 'Start Fly Now',
          width: 220,
          margin: EdgeInsets.only(top: 50),
          onPrassed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, '/main', (route) => false);
          });
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            bonusCard(),
            title(),
            subtitle(),
            startButton(),
          ],
        ),
      ),
    );
  }
}
