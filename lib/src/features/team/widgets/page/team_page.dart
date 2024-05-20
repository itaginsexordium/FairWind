import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fairwind/src/common/common.dart';

@RoutePage()
class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(child: Text(context.routeData.title(context)),);
  }
}
