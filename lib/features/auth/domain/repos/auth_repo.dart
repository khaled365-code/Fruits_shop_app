import 'package:dartz/dartz.dart';
import 'package:fruits_e_commerce_app/core/errors/failure.dart';
import 'package:fruits_e_commerce_app/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});

  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, UserEntity>> loginWithGoogle();

  Future<Either<Failure,UserEntity>> signInWithFacebook();
}
