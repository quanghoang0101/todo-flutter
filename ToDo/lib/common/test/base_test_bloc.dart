// import 'package:bloc/bloc.dart';
// import 'package:bloc_test/bloc_test.dart' as bloc_test;
// import 'package:meta/meta.dart';

// class BaseBlocTest<B extends Bloc<E, S>, E, S> {
//   BaseBlocTest();
//   void test(
//     String description, {
//     B Function() build,
//     Function(B bloc) act,
//     Duration wait,
//     Function(B cubit) verify,
//     @required Iterable expect,
//   }) {
//     return bloc_test.blocTest<B, E, S>(
//       description,
//       build: build,
//       wait: wait,
//       verify: verify,
//       act: act,
//       expect: expect,
//     );
//   }
// }
