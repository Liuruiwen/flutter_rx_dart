import 'package:flutter/material.dart';
import 'package:flutter_rx_dart/until/RxBean.dart';
import 'package:flutter_rx_dart/until/RxDartTest.dart';
import 'package:flutter_rx_dart/until/RxUntil.dart';


class UnderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return UnderPageState();
  }

}



class UnderPageState extends State<UnderPage> {
  final TextEditingController _controllerOne = new TextEditingController();
  final TextEditingController _controllerTwo = TextEditingController();

  final TextEditingController _controllerThree = new TextEditingController();
  RxUntil bloc;
  @override
  Widget build(BuildContext context) {
     bloc = RxDartTest.of(context);

    return new WillPopScope(child: Scaffold(
        appBar: AppBar(
          title: Text('更改数据'),
          centerTitle: true,
        ),
        body: Center(
            child: StreamBuilder(
                stream: bloc.stream,
                initialData: bloc.value,
                builder: (BuildContext context,
                    AsyncSnapshot<RxBean> snapshot) {
                  _processInput(snapshot);
                  return _getList();
                }
            ))), onWillPop: _requestPop);
  }


  /**
   * 监听返回事件
   */
  Future<bool> _requestPop() {
    RxBean bean = new RxBean();
    bean.PageOne ="${_controllerOne.text.trim()}";
    bean.PageTwo = "${_controllerTwo.text.trim()}";
    bean.PageThree = "${_controllerThree.text.trim()}";
    bloc.increment(bean);

    return new Future.value(true);
  }


  Widget _getList() {
    return ListView(
      children: <Widget>[
        new TextField(
          controller: _controllerOne,
          maxLines: 2,
          autocorrect: true,
          autofocus: true,
          decoration: new InputDecoration(
            hintText: "请输入首页内容",
            hintStyle: new TextStyle(color: Colors.grey, fontSize: 14),),
          style: TextStyle(
              fontSize: 18,
              color: Colors.blue), //输入文本的样式
        ),
        new TextField(
          controller: _controllerTwo,
          maxLines: 2,
          autocorrect: true,
          autofocus: true,
          decoration: new InputDecoration(
            hintText: "请输入另类内容",
            hintStyle: new TextStyle(color: Colors.grey, fontSize: 14),),
          style: TextStyle(
              fontSize: 18,
              color: Colors.blue), //输入文本的样式
        ),
        new TextField(
          controller: _controllerThree,
          maxLines: 2,
          autofocus: true,
          decoration: new InputDecoration(
            hintText: "请输入我的内容",
            hintStyle: new TextStyle(color: Colors.grey, fontSize: 14),),
          style: TextStyle(
              fontSize: 18,
              color: Colors.blue), //输入文本的样式
        ),

      ],
    );
  }


  /**
   * 处理输出
   */
  _processInput(AsyncSnapshot<RxBean> snapshot){
    if (snapshot.data != null) {
      String oneContent="${_controllerOne.text.trim()}";
      String twoContent="${_controllerTwo.text.trim()}";
      String threeContent="${_controllerThree.text.trim()}";
      if(oneContent==""){
        _controllerOne.text = snapshot.data.PageOne;
      }
      if(twoContent==""){
        _controllerTwo.text = snapshot.data.PageTwo;
      }
      if(threeContent==""){
        _controllerThree.text = snapshot.data.PageThree;
      }
    }
  }

  Widget getTextField(TextEditingController controller) {
    return new TextField(
      controller: controller,
      minLines: 5,
      autocorrect: true,
      //是否自动更正
      autofocus: true,
      //是否自动对焦
      //文本对齐方式
      style: TextStyle(
          fontSize: 18,
          color: Colors.blue), //输入文本的样式

    );
  }


}
