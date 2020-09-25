///Flutter 中的管道 Stream 所有类型的数据都可以通过Stream传递 值、事件、对象、映射、错误、流等
///通常使用StreamController来控制Stream
///StreamController提供了公开的管道入口 StreamSink 可以通过属性 sink访问
///StreamController通过stream公开的管道的出口
///通过监听StreamController的Stream属性获取传输的数据
///定义监听器，触发事件的时候收到StreamSubscription对象   StreamSubscription可以停止、暂停、回复监听
///StreamTransformer对Stream内部的数据进行处理  过滤(filtering)：根据任何类型的条件过滤数据， 重新组合(regrouping)：重新组合数据， 修改(modification)：对数据应用任何类型的修改，将数据注入其他流，缓冲，处理(processing)：根据数据进行任何类型的操作/操作，
///单订阅流，在整个Stream的生命周期只能有一个监听器  即在第一个订阅被取消后，也无法在此类流上收听两次
///广播流可以添加任意数量的监听器 可以随时向广播流添加监听器。新的监听器将在它开始收听Stream时收到事件