// question model object
class Comment {
  String id;
  final String comment;


  Comment({
    this.id = '',
    required this.comment,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'comment': comment,
      };

  // static Question fromJson(Map<String, dynamic> json) =>
  //     Question(
  //       title: json['title'], 
  //       description: json['description'],
  //       questionLevel: json['questionLevel'], 
  //       questionSubject: json['questionSubject'], 
  //       solvingPreference: json['solvingPreference']);
}