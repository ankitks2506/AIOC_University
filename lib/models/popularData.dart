class Data {
  int id;
  String title;
  String pic;
  int enrollments;
  String description;
  String syllabus;
  String category;

  Data(
      {this.id,
        this.title,
        this.pic,
        this.enrollments,
        this.description,
        this.syllabus,
        this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['Title'];
    pic = json['Pic'];
    enrollments = json['Enrollments'];
    description = json['Description'];
    syllabus = json['Syllabus'];
    category = json['Category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Title'] = this.title;
    data['Pic'] = this.pic;
    data['Enrollments'] = this.enrollments;
    data['Description'] = this.description;
    data['Syllabus'] = this.syllabus;
    data['Category'] = this.category;
    return data;
  }
}