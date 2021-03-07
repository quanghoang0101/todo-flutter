import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

Widget makeTestableWidget({Widget child}) {
  return MediaQuery(
    data: const MediaQueryData(),
    child: MaterialApp(
      home: Scaffold(body: child),
    ),
  );
}

Widget wrapProvider<T extends Bloc>(
  T bloc,
  Widget child,
) =>
    BlocProvider<T>(
      create: (_) => bloc,
      child: child,
    );

Future<void> pumpFunctionWidget(WidgetTester tester,
    {@required Function(BuildContext) function}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Builder(
        builder: (context) {
          return FlatButton(
            onPressed: () => function(context),
            child: const SizedBox(),
          );
        },
      ),
    ),
  );
  await tester.tap(find.byType(FlatButton));
}
