import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'RxBean.dart';


/**
 * Created by Amuser
 * Date:2019/9/24.
 * Desc:
 *
 */
 class RxUntil {
    RxBean _bean;
    var _subject= BehaviorSubject<RxBean>();
    Stream<RxBean> get stream => _subject.stream;
    RxBean get value => _bean;
    void increment(RxBean rxBean) {
      _bean=rxBean;
      _subject.add(_bean);
    }
    void dispose() {
      _subject.close();
    }
 }