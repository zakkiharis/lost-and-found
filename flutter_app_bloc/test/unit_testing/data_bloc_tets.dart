// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_app_bloc/bloc/kehilangan_bloc/kehilangan_bloc.dart';
// import 'package:flutter_app_bloc/data/domain/kehilangan_domain.dart';
// import 'package:flutter_app_bloc/data/repository/kehilangan_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/mockito.dart';

// class MockKehilanganDomain extends Mock implements KehilanganDomain {}

// void main() {
//   KehilanganBloc kehilanganBloc;
//   MockKehilanganDomain kehilanganDomain;

//   setUp(() {
//     kehilanganDomain = MockKehilanganDomain();
//     kehilanganBloc = KehilanganBloc(kehilanganDomain: kehilanganDomain);
//   });

//   group('KehilanganBloc', () {
//     test('throws AssertionError when kehilanganDomain is null', () {
//       expect(
//           () => KehilanganBloc(kehilanganDomain: null), throwsAssertionError);
//     });

//     test('initial state is LoginState', () {
//       expect(kehilanganBloc.state, const KehilanganState());
//     });

//     group('Get Data Bloc', () {
//       blocTest('Get data succes', build: (){
//         when(kehilanganDomain.getKehilangan)
//       });
//     });
//   });
// }
