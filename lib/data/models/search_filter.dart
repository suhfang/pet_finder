
import 'package:pet_finder/data/enums/search_criteria.dart';

class AnimalSearchFilter {
  String? title;
  SearchCriterion? searchCriterion;
  bool? selected;
  AnimalSearchFilter({
    required this.title,
    required this.searchCriterion,
    required this.selected
  });
}