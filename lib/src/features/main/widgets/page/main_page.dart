import 'package:fairwind/src/features/main/models/income_duration_display_type.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fairwind/src/common/common.dart';
import '../widgets.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CustomAppBar(),
        const SizedBox(
          height: Dimensions.app_padding,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.app_padding),
          child: Row(
            children: [
              IncomeDurationDisplay(
                  incomeDurationDisplayType: IncomeDurationDisplayType.day,
                  uSDTAmount: '100.00 USDT',
                  bitcoinAmount: '0.0783 BTC'),
              SizedBox(width: Dimensions.app_padding,),
              IncomeDurationDisplay(
                  incomeDurationDisplayType: IncomeDurationDisplayType.week,
                  uSDTAmount: '1000.00 USDT',
                  bitcoinAmount: '0.7830 BTC'),
              SizedBox(width: Dimensions.app_padding,),
              IncomeDurationDisplay(
                  incomeDurationDisplayType: IncomeDurationDisplayType.year,
                  uSDTAmount: '10000.00 USDT',
                  bitcoinAmount: '7.83032 BTC'),

            ],
          ),
        ),
      ],
    );
  }
}
