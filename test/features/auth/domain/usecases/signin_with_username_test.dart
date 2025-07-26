import 'package:auther/features/auth/domain/entities/token.dart';
import 'package:auther/features/auth/domain/repositories/auth_repository.dart';
import 'package:auther/features/auth/domain/usecases/signin_with_username.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements AuthRepository {}


void main() {
  MockAuthRepository mockRepo = MockAuthRepository();
  SignInWithUsername usecase = SignInWithUsername(mockRepo);

  final token = Token("valid token");


  test(
  'should return a token when sign in with username and password',
  () async {
    when(() => mockRepo.signInWithUsernameAndPassword(any(), any()))
        .thenAnswer((_) async => Right(token));

    final result = await usecase("username", "password");
    expect(result, Right(token));
    verify(() => mockRepo.signInWithUsernameAndPassword("username", "password")).called(1);
  }
  );
}