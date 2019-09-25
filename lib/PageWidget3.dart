import 'package:flutter/material.dart';
import 'package:flutter_rx_dart/until/RxBean.dart';
import 'package:flutter_rx_dart/until/RxDartTest.dart';

import 'UnderPage.dart';

/**
 * Created by Amuser
 * Date:2019/9/24.
 * Desc:
 */
class PageWidget3 extends StatelessWidget {

  BuildContext _context;


  PageWidget3(this._context);

  @override
  Widget build(BuildContext context) {
    final _util = RxDartTest.of(context);
    // TODO: implement build
    return new Center(
      child: new StreamBuilder<RxBean>(
          stream: _util.stream,
          initialData: _util.value,
          builder: (BuildContext context, AsyncSnapshot<RxBean> snapshot) {
            return new GestureDetector(
              child: Text(
                '${snapshot.data==null?"我的":snapshot.data.PageThree}',
                style: Theme
                    .of(context)
                    .textTheme
                    .display1,
              ),
              onTap: (){
                Navigator.of(_context).push(MaterialPageRoute(builder: (context) => UnderPage()));
              },
            );
          }),
    );
  }
}
