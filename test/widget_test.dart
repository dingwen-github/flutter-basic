/////Widget 测试和单元测试一个很明显的区别就是 Widget 测试使用的顶层函数是 testWidgets
//
//import 'package:flutter/material.dart';
//import 'package:flutter_test/flutter_test.dart';
//
//import 'package:flutter_basic/main.dart';
//
//void main() {
//  testWidgets('Add and remove a todo', (WidgetTester tester) async {
//    // Build the widget
//    await tester.pumpWidget(TodoList());
//    // 往输入框中输入 hi
//    await tester.enterText(find.byType(TextField), 'hi');
//    // 点击 button 来触发事件
//    await tester.tap(find.byType(FloatingActionButton));
//    // 让 widget 重绘
//    await tester.pump();
//    // 检测 text 是否添加到 List 中
//    expect(find.text('hi'), findsOneWidget);
//
//    // 测试滑动
//    await tester.drag(find.byType(Dismissible), Offset(500.0, 0.0));
//
//    // 页面会一直刷新，直到最后一帧绘制完成
//    await tester.pumpAndSettle();
//
//    // 验证页面中是否还有 hi 这个 item
//    expect(find.text('hi'), findsNothing);
//
//  });
//
//
//  testWidgets("MyWidget has a title and message", (WidgetTester tester) async {
//    // 加载 MyWidget
//    await tester.pumpWidget(MyWidget(
//      title: "T",
//      message: "M",
//    ));
//
//    final titleFinder = find.text('T');
//    final messageFinder = find.text('M');
//
//    // 验证页面中是否含有上述的两个 Text
//    expect(titleFinder, findsOneWidget);
//    expect(messageFinder, findsOneWidget);
//    find.text('title'); // 通过 text 来定位 widget
//    find.byIcon(Icons.add); // 通过 Icon 来定位 widget
////    find.byWidget(myWidget); // 通过 widget 的引用来定位 widget
//    find.byKey(Key('value')); // 通过 key 来定位 widget
//  });
//}
