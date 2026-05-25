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
      create: (_) => PatientBloc(PatientRepository()),

      child: const _PatientView(),
    );
  }
}

class _PatientView extends StatelessWidget {
  const _PatientView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Patient App')),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),

            child: TextField(
              onChanged: (value) {
                context.read<PatientBloc>().search(value);
              },

              decoration: const InputDecoration(
                hintText: 'Search patient...',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          Expanded(
            child: BlocBuilder<PatientBloc, PatientState>(
              builder: (context, state) {
                if (state is PatientInitial) {
                  return const Center(child: Text('Search patient'));
                }

                if (state is PatientLoaded) {
                  return ListView.builder(
                    itemCount: state.patients.length,

                    itemBuilder: (context, index) {
                      return ListTile(title: Text(state.patients[index].name));
                    },
                  );
                }

                if (state is PatientEmpty) {
                  return const Center(child: Text('No patients found'));
                }

                return const Center(child: Text('Error'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
