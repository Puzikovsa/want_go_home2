import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:want_go_home/models/phone.dart';
import 'change_phone.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  static const rout = '/start-page';

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late final Future<String> _phoneAccess = Provider.of<Phone>(context).readData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Открыть ворота'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ChangePhone.route);
          },
          child: FutureBuilder<String>(
              future: _phoneAccess,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const CircularProgressIndicator();
                  case ConnectionState.active:
                  case ConnectionState.done:
                    return Text(
                      '${snapshot.data}',
                    );
                }
              }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.phone),
      ),
    );
  }
}
