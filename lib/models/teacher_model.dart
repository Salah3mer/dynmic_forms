class TeacherModel {
  final String name;
  final List<ClassModel> classes;

  TeacherModel({required this.name, required this.classes});
}

class ClassModel {
  final num classNumber;
  final String subject;

  ClassModel({required this.classNumber, required this.subject});
}
