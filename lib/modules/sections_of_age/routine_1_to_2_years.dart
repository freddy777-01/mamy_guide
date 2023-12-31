import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/modules/sections_of_age/sleeping_screen1.dart';
import 'package:mamy_guide/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import '../../models/section_of_ages_model.dart';
import 'nutrition_screen1.dart';
import 'package:mamy_guide/modules/sections_of_age/vaccines_screen1.dart';
import 'package:mamy_guide/modules/sections_of_age/normal_growth_rate_screen1.dart';

class Routine1To2YearsScreen extends StatelessWidget {
  Routine1To2YearsScreen({Key? key}) : super(key: key);

  List<SectionOfAgesModel> list = [
    SectionOfAgesModel(
        "Nutrition", "assets/images/ROUTINE1.png", NutritionScreen1()),
    SectionOfAgesModel(
        "Sleeping", "assets/images/ROUTINE2.png", SleepingScreen1()),
    SectionOfAgesModel(
        "Vaccinations", "assets/images/ROUTINE3.png", VaccinesScreen1()),
    SectionOfAgesModel("Normal Growth Data", "assets/images/ROUTINE4.png",
        NormalGrowthRateScreen1()),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 360,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      elevation: 15.0,
                      shadowColor: Colors.white70,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'ROUTINE',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Color(0xFFFFA0A0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '1:2 Years age',
                            style: TextStyle(
                              fontSize: 40.0,
                              color: Color(0xFFFFA0A0),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return sectionOfAgeListItem(context, index, list);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: 10.0,
                    ),
                    itemCount: list.length,
                  )
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {});
  }
}
