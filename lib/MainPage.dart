import 'package:flutter/material.dart';

import 'PageWidget1.dart';
import 'PageWidget2.dart';
import 'PageWidget3.dart';

/**
 * Created by Amuser
 * Date:2019/9/24.
 * Desc:首页
 *
 */
 class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new  MainState();
  }

 }
 class MainState extends State<MainPage>{
   int _currentIndex;
   PageController _controller;

   @override
   void initState() {
     super.initState();
     _currentIndex = 0;
//    _pages = List() ..add(TestPage("第一页"))  ..add(TestPageOne("第二页")) ..add(TestPageTwo("第三页"));
//    _pages = List() ..add(_getItemWidget(HomePage(context)))  ..add(_getItemWidget(CollectionPage())) ..add(_getItemWidget(MinePage(context)));

     _controller = PageController(initialPage: _currentIndex);
//    WidgetsBinding.instance
//        .addPostFrameCallback((_) => _loadingPage());
   }
   @override
   void didChangeDependencies() {
     super.didChangeDependencies();
     //渲染完成第一帧后会走这个回调,弹窗也要在渲染完成后才能调用

   }

   @override
   void dispose() {
     super.dispose();
     _controller.dispose();
   }

   @override
   Widget build(BuildContext context) => Scaffold(
     body:_getPageView(),
//    _pages==null?new Container() :PageView.builder(
//        physics: NeverScrollableScrollPhysics(),//viewPage禁止左右滑动
//        onPageChanged: _pageChange,
//        controller: _controller,
//        itemCount: _pages.length,
//        itemBuilder: (context, index) => _pages[index]),
     bottomNavigationBar: BottomNavigationBar(
       items: getItems(),
       currentIndex: _currentIndex,
       onTap: onTap,
     ),
   );



   Widget _getPageView(){
     return new PageView(
       physics: NeverScrollableScrollPhysics(),//viewPage禁止左右滑动
       onPageChanged: _pageChange,
       controller: _controller,
       children: <Widget>[
         new Offstage(
           offstage: _currentIndex != 0,
           child: new TickerMode(
             enabled: _currentIndex == 0,
             child: new MaterialApp(
               home: new PageWidget1(context),
             ),
           ),
         ),
         new Offstage(
           offstage: _currentIndex != 1,
           child: new TickerMode(
             enabled: _currentIndex == 1,
             child: new MaterialApp(
               home: new PageWidget2(context),
             ),
           ),
         ),
         new Offstage(
           offstage: _currentIndex != 2,
           child: new TickerMode(
             enabled: _currentIndex == 2,
             child: new MaterialApp(
               home: new PageWidget3(context),
             ),
           ),
         ),
       ],);
   }
   List<BottomNavigationBarItem> getItems() {
     return [
       BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
       BottomNavigationBarItem(icon: Icon(Icons.collections), title: Text("另类")),
       BottomNavigationBarItem(icon: Icon(Icons.person), title: Text("我的"))
     ];
   }



   void onTap(int index) {
     _controller.jumpToPage(index);
   }

   void _pageChange(int index) {
     if (index != _currentIndex) {
       setState(() {
//        print("==="+index.toString());
         _currentIndex = index;
       });
     }
   }

 }