import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pet_finder/cubit/animal_cubit.dart';
import 'package:pet_finder/data/models/search_filter.dart';
import 'package:pet_finder/data/enums/search_criteria.dart';

part 'search_filter_state.dart';

class SearchFilterCubit extends Cubit<SearchFilterState> {
  final SearchFilterCubit? searchFilterCubit;
  SearchFilterCubit({this.searchFilterCubit}) : super(SearchFilterInitial());
  List<AnimalSearchFilter> _availableCriteria = [
    AnimalSearchFilter(
      title: 'Type',
      searchCriterion: SearchCriterion.type,
      selected: true
    ),
    AnimalSearchFilter(
      title: 'Breed',
      searchCriterion: SearchCriterion.breed,
      selected: true
    ),
    AnimalSearchFilter(
      title: 'Color',
      searchCriterion: SearchCriterion.color,
      selected: true
    ),
    AnimalSearchFilter(
      title: 'Gender',
      searchCriterion: SearchCriterion.gender,
      selected: true
    ),
  ];

  List<AnimalSearchFilter> getSelectedCriteria() {
    return _availableCriteria;
  }

  void changeCriteria({String? withTitle, bool? value}) {
    if (withTitle != null && value != null) {
      _availableCriteria = _availableCriteria.map((availableCriterion) {
        if (availableCriterion.title == withTitle) {
          availableCriterion.selected = value;
        }
        return availableCriterion;
      }).toList();
      emit(SearchFilterChanged(criteria: _availableCriteria));
    }
  }

  void setCriteria({required List<AnimalSearchFilter> criteria}) {
    _availableCriteria = criteria;
    emit(SearchFilterChanged(criteria: _availableCriteria));
  }
}
