class Calcul {
  late int? id;
  late String expression;
  late String result;
  late String date;

  Calcul();

  void fromMap(Map? map) {
    //  if (id != null) {
    //   id = map['id'];
    // }    
    id = map?['id'];
    expression = map?['expression'];
    result = map?['result'];
    date = map?['date'];
    // print(map);
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'expression': expression, 'result': result,'date':date, 'id':id};
    // if (id != 0) {
    //   map['id'] = id;
    // }
    return map;
  }
}
