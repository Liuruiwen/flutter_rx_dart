import 'package:flutter/material.dart';

import 'RxUntil.dart';

/**
 * Created by Amuser
 * Date:2019/9/24.
 * Desc:InheritedWidget
 */
class RxDartTest extends InheritedWidget {
 final RxUntil bLoC = RxUntil();

 RxDartTest({Key key, Widget child}) : super(key: key, child: child);

 @override
 bool updateShouldNotify(_) => true;

 static RxUntil of(BuildContext context) =>
     (context.inheritFromWidgetOfExactType(RxDartTest) as RxDartTest).bLoC;
}
