import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  final String id;
  final String? email;
  final String? name;
  final String? photo;

  static const empty = User(id: '');

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  factory User.fromSnapshot(DocumentSnapshot snap) {
    return User(
      id: snap.id,
      email: snap["email"],
      name: snap["name"],
      photo: snap["photo"],
    );
  }

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      id: doc.id,
      email: doc["email"],
      name: doc["name"],
      photo: doc["photo"],
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "email": email,
    };
  }

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        photo,
      ];
}
