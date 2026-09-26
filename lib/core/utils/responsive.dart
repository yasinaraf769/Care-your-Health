import 'package:flutter/widgets.dart';

import '../constants/app_constants.dart';

class Responsive {
  const Responsive._();

  static bool isDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppConstants.desktopBreakpoint;

  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= AppConstants.tabletBreakpoint;
}
