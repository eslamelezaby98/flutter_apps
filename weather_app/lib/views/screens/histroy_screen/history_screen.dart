import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/data/models/history.dart';
import 'package:weather_app/data/services/hive_boxes.dart';
import 'package:weather_app/helper/constants_manager.dart';
import 'package:weather_app/helper/routes_manager.dart';

class HistroyScreen extends StatefulWidget {
  const HistroyScreen({Key? key}) : super(key: key);

  @override
  State<HistroyScreen> createState() => _HistroyScreenState();
}

class _HistroyScreenState extends State<HistroyScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Hive.openBox<Histroy>(ConstantsManager.history);
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   Hive.close();
  // }

  void deleteItem(Histroy histroy) async {
    await histroy.delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ValueListenableBuilder<Box<Histroy>>(
        valueListenable: Boxes.getHistory().listenable(),
        builder: (context, value, child) {
          final history = value.values.toList().cast<Histroy>();
          return ListView.builder(
            itemCount: history.length,
            itemBuilder: (context, index) {
              return BuildHistoryWidget(
                countryName: history[index].countryName,
                onPress: () {
                  deleteItem(history[index]);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class BuildHistoryWidget extends StatelessWidget {
  const BuildHistoryWidget({
    Key? key,
    required this.countryName,
    required this.onPress,
  }) : super(key: key);

  final String countryName;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            countryName,
            // histroyItem.countryName,
            style: Theme.of(context).textTheme.headline4,
          ),
          trailing: IconButton(
            onPressed: onPress,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
        const Divider(
          color: Colors.white,
        ),
      ],
    );
  }
}
