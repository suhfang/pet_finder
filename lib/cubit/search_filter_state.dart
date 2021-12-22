part of 'search_filter_cubit.dart';

@immutable
abstract class SearchFilterState {}

class SearchFilterInitial extends SearchFilterState {}
class SearchFilterChanged extends SearchFilterState {
  final List<AnimalSearchFilter> criteria;
  SearchFilterChanged({
    required this.criteria
  });
}
