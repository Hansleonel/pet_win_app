import 'package:flutter/material.dart';
import 'package:pet_app_win/config/theme/constants/constants.dart';
import 'package:pet_app_win/presentation/widgets/shared/app_bar_stepper.dart';

class Successfullpage extends StatefulWidget {
  static const route = 'successfullPage';

  const Successfullpage({Key? key}) : super(key: key);

  @override
  State<Successfullpage> createState() => _SuccessfullpageState();
}

class _SuccessfullpageState extends State<Successfullpage> {
  late Future<bool> _analysisFuture;

  @override
  void initState() {
    super.initState();
    _analysisFuture = loadData();
  }

  Future<bool> loadData() async {
    await Future.delayed(
        const Duration(seconds: 4)); // simula un retraso de 4 segundos
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBar(
        title: const AppBarStepper(orderActivate: 2),
      ),
      body: FutureBuilder<bool>(
        future: _analysisFuture,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Analizando datos...'),
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check_circle, color: primaryColor, size: 96),
                  Text('Analizado exitosamente', style: titleStyle),
                ],
              ),
            );
          } else {
            // En caso de un error, puedes manejarlo aquí.
            return const Center(child: Text('Ocurrió un error.'));
          }
        },
      ),
    );
  }
}
