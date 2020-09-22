import 'dart:developer';

import 'package:flutter_test/flutter_test.dart';
import '../lib/demoes/test/counter.dart';

///单元测试


///也可以使用命令来运行测试用例  flutter test test/counter_test.dart

void main() {
  ///test(...) 方法是用来定义一个单元测试的  方法里面有两个必需的参数，第一个参数表示这个单元测试的描述信息，第二个是一个 Function，用来编写测试内容的
  /// expect(...) 方法用来验证结果的 方法中也有两个必需的参数，第一个是需要验证的变量，第二个是与该变量匹配的值
  test('测试_value递增', () {
    final counter = Counter();
    counter.increment();

    ///验证_value的结果是不是1
    expect(counter.value, 1);
  });


  ///使用group来执行多个测试
  group('Counter', () {
    test('increment', () {
      final counter = Counter();
      counter.increment();

      expect(counter.value, 3);
    });
    test('decrement', () {
      final counter = Counter();
      expect(counter.value, 3);
    });
  });
}