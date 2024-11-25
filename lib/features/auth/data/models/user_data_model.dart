import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

class UserDataModel extends UserEntity {
  UserDataModel(
      {required super.name, required super.email, required super.uId});

  factory UserDataModel.fromFirebaseAuth(User user) 
  {
    return UserDataModel(
        name: user.displayName ?? '', email: user.email ?? '', uId: user.uid);
  }
}
