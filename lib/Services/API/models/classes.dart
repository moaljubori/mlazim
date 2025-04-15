 

// ignore_for_file: camel_case_types, non_constant_identifier_names

class clas {
  String id;
  String classname;
  String date;
  String time;
  String classnumber;
  String count_malazim;
  String count_exam;
  String last_date;
  String last_date_exam;
  String ads;


    clas({
    required this.id,
    required this.classname,
    required this.date,
    required this.time,
    required this.classnumber,
    required this.count_malazim,
    required this.count_exam,
    required this.last_date,
    required this.last_date_exam,
    required this.ads,
  });

  factory clas.fromJson(Map<String, dynamic> json) {
    return clas(
      id: json['id'],
      classname: json['classname'],
      date: json['date'],
      time: json['time'],
      classnumber: json['classnumber'],
      count_malazim: json['count_malazim'],
      count_exam: json['count_exam'],
      last_date: json['last_date'],
      last_date_exam: json['last_date_exam'],
      ads: json['ads'],
    );
  }
} 
