import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/patient_bloc.dart';
import '../bloc/patient_state.dart';
import '../repository/patient_repository.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PatientBloc(PatientRepository())..load(),

      child: const _PatientView(),
    );
  }
}

class _PatientView extends StatelessWidget {
  const _PatientView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<PatientBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text("Patient App")),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),

            child: TextField(
              onChanged: (value) {
                bloc.search(value);
              },

              decoration: const InputDecoration(
                hintText: "Search patient...",

                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<PatientBloc, PatientState>(
              builder: (context, state) {
                print(state.runtimeType);

                if (state is PatientLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is PatientLoaded) {
                  if (state.patients.isEmpty) {
                    return const Center(
                      child: Text("There are no patients to show"),
                    );
                  }

                  return ListView.builder(
                    itemCount: state.patients.length,

                    itemBuilder: (context, index) {
                      final patient = state.patients[index];

                      return ListTile(title: Text(patient.name));
                    },
                  );
                }

                return const Center(child: Text("Search Patients"));
              },
            ),
          ),
        ],
      ),
    );
  }
}
