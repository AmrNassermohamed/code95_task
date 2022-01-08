import 'package:code95_task/provider/provider_query_builder.dart';
import 'package:code95_task/screen/query_builder/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [

      ChangeNotifierProvider(create: (_) =>QueryBuilderProvider(),),
      //create: (_) => LocalizationProvider(),
    ],
    child: MyApp(),
  ));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
          debugShowCheckedModeBanner: false,
          home:QueryBuilder(), //SubSubdepartment(id: 12.toString(),),


    );
  }
  }


