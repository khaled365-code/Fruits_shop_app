import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_e_commerce_app/core/errors/failure.dart';
import 'package:fruits_e_commerce_app/core/utils/services/firebase_auth_service.dart';
import 'package:fruits_e_commerce_app/features/auth/data/models/user_data_model.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImplementation({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final User user = await firebaseAuthService
          .createUserWithEmailAndPassword(email: email, password: password);

      return Right(UserDataModel.fromFirebaseAuth(user));
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(message: e.message!));
    } catch (e) {
      return Left(
          ServerFailure(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى لاحقًا'));
    }
  }
}
