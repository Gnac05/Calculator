class EquationSD {
  late int? id;
  late String a;
  late String b;
  late String c;
  late String day;

  EquationSD();

  fromMap(Map<String, dynamic>? map) {
    // print(map);
    id = map?['id'];
    a= map?['a'];
    b= map?['b'];
    c= map?['c'];
    day = map?['day'];
  }

  Map<String,dynamic> toMap(){
    return {
      'id': id,
      'a':a,
      'b':b,
      'c':c,
      'day':day
    };
  }

}
