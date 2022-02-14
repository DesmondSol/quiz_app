final String tableUsers = 'users';

class UserField {
  static final List<String> values = [
    /// Add all fields
    id, name, email, password, phone, time
  ];

  static final String id = '_id';
  static final String name = 'name';
  static final String email = 'email';
  static final String password = 'password';
  static final String phone = 'phone';
  static final String time = 'time';
}

class AppUsersModel {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phone;
  final DateTime createdTime;

  const AppUsersModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.createdTime,
  });

  AppUsersModel copy({
    int? id,
    String? name,
    String? email,
    String? password,
    String? phone,
    DateTime? createdTime,
  }) =>
      AppUsersModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        phone: phone ?? this.phone,
        createdTime: createdTime ?? this.createdTime,
      );

  static AppUsersModel fromJson(Map<String, Object?> json) => AppUsersModel(
        id: json[UserField.id] as int?,
        name: json[UserField.name] as String?,
        email: json[UserField.email] as String?,
        password: json[UserField.password] as String?,
        phone: json[UserField.phone] as String?,
        createdTime: DateTime.parse(json[UserField.time] as String),
      );

  Map<String, Object?> toJson() => {
        UserField.id: id,
        UserField.name: name,
        UserField.email: email,
        UserField.password: password,
        UserField.phone: phone,
        UserField.time: createdTime.toIso8601String(),
      };
}
