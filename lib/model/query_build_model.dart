import 'package:code95_task/model/lookups.dart';

class QueryBuilderModel {
  late LookupsModel key;
  late LookupsModel operator;
  late LookupsModel orAnd;
  late int sortSearch;
  late String value;
  late String sortOperator;
  late bool showKey;
  late bool showOperator;
  late bool showAddORJoin;
  QueryBuilderModel({required this.showKey,
   required this.sortSearch,
    required this.value,
    required this.orAnd,
    required this.sortOperator,
    required this.key,
    required this.showOperator,

    required this.showAddORJoin,
    required this.operator,
  });
}