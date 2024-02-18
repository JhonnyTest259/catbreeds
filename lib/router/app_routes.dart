import 'package:flutter/material.dart';
import 'package:catbreeds/models/models.dart';
import 'package:catbreeds/src/screen.dart';

class AppRoutes {
  static const initialRoute = 'mapa';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
      route: "inicial",
      screen: BreedScreen(),
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}
