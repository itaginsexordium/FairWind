import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fairwind/src/common/common.dart';

@RoutePage()
class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(context.routeData.title(context)),);
  }
}
