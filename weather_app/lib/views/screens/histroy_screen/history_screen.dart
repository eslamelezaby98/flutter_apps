import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../../data/models/history.dart';
import '../../../data/services/hive_boxes.dart';
import '../../../helper/routes_manager.dart';

class HistroyScreen extends StatefulWidget {
  const HistroyScreen({Key? key}) : super(key: key);

  @override
  State<HistroyScreen> createState() => _HistroyScreenState();
}

class _HistroyScreenState extends State<HistroyScreen> {


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
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.countryScreen,
                    arguments: history[index].countryName,
                  );
                },
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
    required this.onTap,
  }) : super(key: key);

  final String countryName;
  final Function() onPress;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: onTap,
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
