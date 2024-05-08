import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'channels/app_channels.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var channelString = 'Channel: Nada ainda';
  Future<void> _shareToNative() async {
    try {
      channelString = await MethodChannelHelper.shareSocial('OPA 2');
      setState(() {});
    } on PlatformException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              channelString,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shareToNative,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
