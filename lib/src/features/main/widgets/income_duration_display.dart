import 'package:flutter/material.dart';
import 'package:fairwind/src/common/common.dart';
import '../models/models.dart';

class IncomeDurationDisplay extends StatelessWidget {
  const IncomeDurationDisplay(
      {required this.incomeDurationDisplayType,
      required this.uSDTAmount,
      required this.bitcoinAmount,
      super.key});

  final IncomeDurationDisplayType incomeDurationDisplayType;
  final String uSDTAmount;
  final String bitcoinAmount;

  // TODO: локализация
  String getTitleByType(IncomeDurationDisplayType incomeDurationDisplayType) {
    switch (incomeDurationDisplayType) {
      case IncomeDurationDisplayType.day:
        return 'Income per day';
        break;
      case IncomeDurationDisplayType.week:
        return 'Income per week';
        break;
      case IncomeDurationDisplayType.year:
        return 'Income per year';
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: Dimensions.edgeInsets_app_padding,
        decoration: BoxDecoration(
          color: AppTheme.c_white,
          borderRadius: Dimensions.cardBorderRadius,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    getTitleByType(incomeDurationDisplayType),
                    style: AppTheme.ts_14_regular_exo2
                        .copyWith(color: AppTheme.c_text_2),
                  ),
                  const SizedBox(
                    height: Dimensions.app_half_padding,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.mainPage.tether.svg(),
                      SizedBox(width: Dimensions.app_half_padding,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            uSDTAmount,
                            style: AppTheme.ts_16_semi_bold_exo2,
                          ),
                          SizedBox(height: Dimensions.app_half_padding/2,),
                          Text(
                            '≈ $uSDTAmount',
                            style: AppTheme.ts_10_regular_exo2
                                .copyWith(color: AppTheme.c_text_2),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: Dimensions.app_padding,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Assets.mainPage.bitcoin.svg(),
                      SizedBox(width: Dimensions.app_half_padding,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bitcoinAmount,
                            style: AppTheme.ts_16_semi_bold_exo2,
                          ),
                          SizedBox(height: Dimensions.app_half_padding/2,),
                          Text(
                            '≈ $bitcoinAmount',
                            style: AppTheme.ts_10_regular_exo2
                                .copyWith(color: AppTheme.c_text_2),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(width: Dimensions.app_padding,),
            Align(
              alignment: Alignment.centerRight,
              child: Assets.mainPage.fakeChart1.svg(),
            ),
          ],
        ),
      ),
    );
  }
}
