import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

/// 使用 mockito 模拟一个类 B
class MockB extends Mock implements B {}

void main() {
  test("测试使用 mockito 来 mock 依赖", () {
    var b = MockB();
    var a = A();
    // 当调用 b.getRandomNum() 方法的时候返回 10
    when(b.getRandomNum()).thenReturn(10);
    expect(a.calculate(b), 20);

    // 检查 b.getRandomNum(); 是否调用过
    verify(b.getRandomNum());
  });
}

class A {
  int calculate(B b) {
    int randomNum = b.getRandomNum();
    return randomNum * 2;
  }
}

class B {
  int getRandomNum() {
    return Random().nextInt(100);
  }
}