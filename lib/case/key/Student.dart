class Student{
  String id;
  String name;
  Student({this.id,this.name}):assert(id != null && name != null);

  @override
  bool operator ==(Object other) =>
      //比较内存地址 ||  内容是否相同
      identical(this, other) ||
      other is Student &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  // ^ 按位或
  int get hashCode => id.hashCode ^ name.hashCode;
}