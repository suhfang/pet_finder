
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_finder/cubit/animal_cubit.dart';
import 'package:pet_finder/cubit/search_filter_cubit.dart';
import 'package:pet_finder/data/models/search_filter.dart';
import 'package:pet_finder/data/network_service.dart';
import 'package:pet_finder/data/repository.dart';


class FindPetScreen extends StatelessWidget {
   FindPetScreen({Key? key}) : super(key: key);
  var searchCubit = SearchFilterCubit();
  void openSearchMenu(
      {required BuildContext buildContext}) async {

    await showModalBottomSheet(
        context: buildContext,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (sheetContext) {
          return BlocProvider(
            create: (context) => searchCubit, child: BlocBuilder<SearchFilterCubit, SearchFilterState>(
              builder: (searchCubitContext, state) {

                List<AnimalSearchFilter> items;
                if (state is SearchFilterChanged) {
                  items = state.criteria;
                } else {
                  items =  BlocProvider.of<SearchFilterCubit>(searchCubitContext).getSelectedCriteria();
                }

                return SizedBox(
                    height: 400,
                    child: Column(
                      children: [

                        SizedBox(
                          height: 300,
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return CheckboxListTile(
                                  value: item.selected,
                                  onChanged: (bool? value) {
                                    BlocProvider.of<SearchFilterCubit>(searchCubitContext).changeCriteria(withTitle: item.title, value: value);
                                    searchCubit = SearchFilterCubit();
                                    searchCubit.setCriteria(criteria: BlocProvider.of<SearchFilterCubit>(searchCubitContext).getSelectedCriteria());
                                  },
                                  title: Text('${item.title}'),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                              itemCount: items.length
                          ),
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  child: const SizedBox(
                                    height: 50,
                                    child: Center(
                                      child: Text('Apply Filters', style: TextStyle(fontSize: 14),),
                                    ),
                                  ),
                                  onPressed: () {

                                  },
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              side: BorderSide(color: Colors.blue)
                                          )
                                      )
                                  ),),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                );
              },
            ),

        );

          // });
        });

  }
  Widget searchButton(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            child: const SizedBox(
              height: 50,
              child: Center(
                  child: Text('Search Pets', style: TextStyle(fontSize: 14),),
              ),
            ),
            onPressed: () {

            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        side: BorderSide(color: Colors.blue)
                    )
                )
            ),),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Form(
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Search for a pet', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                const SizedBox(height: 10,),
                const Text('We search over a good number of pets to give you results by type, breed, color and gender!'),
                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  child: TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(Icons.search),
                        labelText: 'Enter gender, type, breed, or color of a pet',
                        suffix: Container(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              openSearchMenu(buildContext: context);
                            },
                            child: const Icon(Icons.filter_list, color: Colors.blue,),
                          ),
                        )
                    ),
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xF1F1F1F1)
                  ),
                ),
                const SizedBox(height: 20,),
                searchButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
