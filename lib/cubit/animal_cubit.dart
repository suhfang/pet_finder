import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pet_finder/data/models/search_filter.dart';
import 'package:pet_finder/data/repository.dart';
import 'package:pet_finder/data/enums/search_criteria.dart';

part 'animal_state.dart';

class AnimalCubit extends Cubit<AnimalState> {

  Repository? repository;
  AnimalCubit({this.repository}) : super(AnimalInitial());


  void _findAnimalsByGender(String gender) {

  }

  void _findAnimalsByBreed(String breed) {

  }

  void _findAnimalsByColor(String color) {

  }

  void _findAnimalsByType(String type) {

  }

  void findAnimals({required SearchCriterion searchCriteria, required String query}) {
    switch (searchCriteria) {
      case SearchCriterion.gender:
        _findAnimalsByGender(query);
        break;
      case SearchCriterion.breed:
        _findAnimalsByBreed(query);
        break;
      case SearchCriterion.color:
        _findAnimalsByColor(query);
        break;
      case SearchCriterion.type:
        _findAnimalsByType(query);
        break;
    }
  }

}
