//
//
//import 'package:firebase_auth/firebase_auth.dart';
//import 'dart:io';
//import 'package:flutter_test/flutter_test.dart';
//import 'package:mockito/mockito.dart';
//import 'package:matcher/matcher.dart';
//import 'package:flutter_firebase_myapp/service/firebase_auth_provider.dart';
//class MockFirebaseAuth extends Mock implements FirebaseAuthProvider{}
//
//void main(){
//
//  String fixture(String name) =>
//    File('test/db/$name.json').readAsStringSync();
//  MockFirebaseAuth mockFirebaseAuth;
//
//  setUp((){
//    mockFirebaseAuth=MockFirebaseAuth();
//  });
//
//  group('authenthication', (){
//    test("GoogleSinIn process if user is equal to currentuser then returns successful", () async {
//      when(mockFirebaseAuth.onGoogleSignIn())
//          .thenAnswer(
//          (_) async => fixture('firebase_auth_success'),
//      );
//
//      expect(mockFirebaseAuth.getCurrentUser() == mockFirebaseAuth.mCurrentUserId, true);
//    });
//
//
//    test("returns if user is not equal to currentUser then signOut user", () async {
//      when(mockFirebaseAuth.onGoogleSignIn())
//          .thenAnswer(
//            (_) async => fixture('firebase_auth_failure'),
//      );
//
//      expect(mockFirebaseAuth.getCurrentUser() != mockFirebaseAuth.mCurrentUserId, false);
//      expect(mockFirebaseAuth.getCurrentUser()==null, true);
//    });
//
//  });
//  test("return if the network is down there is no network or data the throw NetworkFaliure",(){
//       when(mockFirebaseAuth.onGoogleSignIn())
//           .thenAnswer((_)async => fixture('firebase_auth_failure'));
//
//       expect(mockFirebaseAuth.onGoogleSignIn(), NetworkFailureException());
//  });
//}