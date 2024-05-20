import 'package:flutter/material.dart';
import 'package:fairwind/src/common/common.dart';

// TODO: Уточнить как верстать виджет (что за логин и тп) и после загнать строки в локализацию
// Настроить отступы внутри и размеры (сейчас неверные)
class MiniMemberProfile extends StatelessWidget {
  const MiniMemberProfile(
      {required this.firstName, required this.lastName, super.key});

  final String firstName;
  final String lastName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: Dimensions.edgeInsets_app_padding,
      decoration: BoxDecoration(
        color: AppTheme.c_background,
        borderRadius: Dimensions.cardBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$firstName $lastName',
            style: AppTheme.ts_16_regular_exo2,
          ),
          // TODO: загнать в размеры
          const SizedBox(
            height: Dimensions.app_half_padding/2,
          ),
          // TODO: уточнить что тут должно быть
          Text(
            'Login',
            style: AppTheme.ts_12_regular_exo2.copyWith(color: AppTheme.c_text_3),
          ),
          const SizedBox(
            height: Dimensions.app_half_padding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Assets.leftMenu.starAssistant.image(width: 16, height: 16),
              const SizedBox(width: Dimensions.app_half_padding,),
              Text('Assistant', style: AppTheme.ts_12_regular_exo2,),
              const SizedBox(width: Dimensions.app_half_padding,),
              Assets.leftMenu.crownPremium.image(width: 16, height: 16),
              const SizedBox(width: Dimensions.app_half_padding,),
              Text('Premium', style: AppTheme.ts_12_regular_exo2,),
            ],
          )
        ],
      ),
    );
  }
}
