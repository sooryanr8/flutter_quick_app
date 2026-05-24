import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/patient_bloc.dart';
import '../bloc/patient_state.dart';
import '../repository/patient_repository.dart';

class PatientScreen extends StatelessWidget {
  PatientScreen({super.key});

  final bloc = PatientBloc(PatientRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc..load(),

      child: Scaffold(
        appBar: AppBar(title: const Text("Patients")),

        body: BlocBuilder<PatientBloc, PatientState>(
          builder: (context, state) {
            if (state is PatientLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is PatientLoaded) {
              return ListView.builder(
                itemCount: state.patients.length,

                itemBuilder: (context, index) {
                  final p = state.patients[index];

                  return ListTile(title: Text(p.name), subtitle: Text(p.id));
                },
              );
            }

            return const Center(child: Text("No Data"));
          },
        ),
      ),
    );
  }
}
