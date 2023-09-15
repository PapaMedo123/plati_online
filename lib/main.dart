import 'package:flutter/material.dart';
import 'package:plati_online/data/data.dart';
import 'package:plati_online/data/icon.dart';
import 'package:plati_online/map.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Плати онлине'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AppData data = AppData();
  bool mapEnapled = false;

  void onPressed() {
    setState(() {
      mapEnapled ? mapEnapled = false : mapEnapled = true;
    });
  }

  void onTap(AppIcon appIcon) async {
    if (mapEnapled) {
      String name = appIcon.name;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => MapSample(name)));
      return;
    }
    if (!await launchUrl(appIcon.link)) {
      throw Exception('Could not launch link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mapEnapled
            ? Theme.of(context).colorScheme.inverseSurface
            : Theme.of(context).colorScheme.inversePrimary,
        title: mapEnapled
            ? const Text("Избери икона", style: TextStyle(color: Colors.white))
            : Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.not_listed_location_outlined),
            color: mapEnapled
                ? Colors.blue.shade300
                : Theme.of(context).iconTheme.color,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: (data.list.length / 3).ceil() + 1,
        itemBuilder: (context, row) {
          List<AppIcon> iconList = [];

          if (row == 0) {
            return ListRow(iconList, onTap, false);
          }
          row -= 1;

          for (int i = 0; i < 3; i++) {
            if (((row * 3) + i) < data.list.length) {
              iconList.add(data.list[row * 3 + i]);
            }
          }
          return ListRow(iconList, onTap, mapEnapled);
        },
      ),
    );
  }
}

class ListRow extends StatelessWidget {
  final List<AppIcon> iconList;
  static double iconSize = 60;
  final Function onTap;
  final bool mapEnabled;

  const ListRow(this.iconList, this.onTap, this.mapEnabled, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        iconList.isNotEmpty
            ? RowElement(iconList[0], iconSize, onTap, mapEnabled)
            : _spacer,
        iconList.length >= 2
            ? RowElement(iconList[1], iconSize, onTap, mapEnabled)
            : _spacer,
        iconList.length >= 3
            ? RowElement(iconList[2], iconSize, onTap, mapEnabled)
            : _spacer,
      ],
    );
  }

  static final Container _spacer = Container(
    width: iconSize,
    height: iconSize,
    margin: const EdgeInsets.symmetric(vertical: 8.0),
  );
}

class RowElement extends StatelessWidget {
  final AppIcon appIcon;
  final double iconSize;
  final Function onTap;
  final bool mapEnabled;

  const RowElement(this.appIcon, this.iconSize, this.onTap, this.mapEnabled,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(children: [
        InkWell(
          onTap: () => onTap(appIcon),
          child: Container(
            constraints: BoxConstraints.loose(Size(iconSize, iconSize)),
            decoration: mapEnabled
                ? const BoxDecoration(
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                          //offset: Offset(0, 4),
                          color: Colors.green, //edited
                          spreadRadius: 4,
                          blurRadius: 10 //edited
                          )
                    ],
                  )
                : const BoxDecoration(),
            child: appIcon.image,
          ),
        ),
        Text(
          appIcon.name,
          style: const TextStyle(fontSize: 12),
        ),
      ]),
    );
  }
}
