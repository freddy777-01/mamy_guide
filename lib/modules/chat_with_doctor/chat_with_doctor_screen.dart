import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:mamy_guide/cubit/cubit.dart';
import 'package:mamy_guide/cubit/states.dart';
import 'package:mamy_guide/models/doctor_model.dart';
import 'package:mamy_guide/modules/doctor_profile/doctor_profile_screen.dart';

class ChatWithDoctorScreen extends StatelessWidget {
  const ChatWithDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).getAllDoctors();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (BuildContext context, AppStates states) {},
      builder: (BuildContext context, AppStates states) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Doctors',
              style: TextStyle(color: Color(0xFFFFE3E3)),
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Conditional.single(
              context: context,
              conditionBuilder: (BuildContext context) =>
                  states is! GetAllDoctorsLoadingState,
              widgetBuilder: (BuildContext context) {
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return buildDoctorListItem(
                        context: context,
                        doctor: AppCubit.get(context).doctorsList[index]);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: AppCubit.get(context).doctorsList.length,
                );
              },
              fallbackBuilder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFFFA0A0),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget buildDoctorListItem({
    required BuildContext context,
    required DoctorModel doctor,
  }) =>
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DoctorProfileScreen(
                doctor: doctor,
              );
            }),
          );
        },
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/doctor.png'),
            ),
            const SizedBox(width: 10),
            Text(
              'Dr. ${doctor.name}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFFFFE3E3),
              ),
            ),
          ],
        ),
      );
}
