final String tableQuestion = 'question';

class QuestionField {
  static final List<String> values = [
    /// Add all fields
    id, author, description, question, choice_a,choice_b,choice_c,choice_d,tags,answer,
   
  ];

  static final String id = '_id';
  static final String author = 'author';
  static final String description = 'description';
  static final String question = 'question';
  static final String choice_a = 'choice_a';
  static final String choice_b = 'choice_b';
  static final String choice_c = 'choice_c';
  static final String choice_d = 'choice_d';
  static final String tags = 'tags';
  static final String answer = 'answer';
}

class AppQuestionsModel {
  final int? id;
  final String? author;
  final String? description;
  final String? question;
  final String? choice_a;
  final String? choice_b;
  final String? choice_c;
  final String? choice_d;
  final String? tags;
  final String? answer;

  const AppQuestionsModel({
    this.id,
    required this.author,
    required this.description,
    required this.question,
    required this.choice_a,
    required this.choice_b,
    required this.choice_c,
    required this.choice_d,
    required this.tags,
    required this.answer,
  });

  AppQuestionsModel copy({
    int? id,
    String? author,
    String? description,
    String? question,
    String? choice_a,
    String? choice_b,
    String? choice_c,
    String? choice_d,
    String? tags,
    String? answer,
  }) =>
      AppQuestionsModel(
        id: id ?? this.id,
        author: author ?? this.author,
        description: description ?? this.description,
        question: question ?? this.question,
        choice_a: choice_a ?? this.choice_a,
        choice_b: choice_b ?? this.choice_b,
        choice_c: choice_c ?? this.choice_c,
        choice_d: choice_d ?? this.choice_d,
        tags: tags ?? this.tags,
        answer: answer ?? this.answer,

      );

  static AppQuestionsModel fromJson(Map<String, Object?> json) => AppQuestionsModel(
        id: json[QuestionField.id] as int?,
        author: json[QuestionField.author] as String?,
        description: json[QuestionField.description] as String?,
        question: json[QuestionField.question] as String?,
        choice_a: json[QuestionField.choice_a] as String?,
        choice_b: json[QuestionField.choice_b] as String?,
        choice_c: json[QuestionField.choice_c] as String?,
        choice_d: json[QuestionField.choice_d] as String?,
        tags: json[QuestionField.tags] as String?,
        answer: json[QuestionField.answer] as String?,
      
      );

  Map<String, Object?> toJson() => {
        QuestionField.id: id,
        QuestionField.author: author,
        QuestionField.description: description,
        QuestionField.question: question,
        QuestionField.choice_a: choice_a,
        QuestionField.choice_b: choice_b,
        QuestionField.choice_c: choice_c,
        QuestionField.choice_d: choice_d,
        QuestionField.tags: tags,
        QuestionField.answer: answer,
        
      };
}
