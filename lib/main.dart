import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final localStringKey = 'LOCAL_STRING';
  final secureStringKey = 'SECURE_STRING';
  final TextEditingController localStringController = TextEditingController();
  final TextEditingController secureStringController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('POC Pluxee Web'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 128.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Set local String:'),
                        Expanded(
                          child: TextFormField(
                            controller: localStringController,
                            maxLength: 50,
                            maxLines: 1,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            sharedPreferences.setString(
                              localStringKey,
                              localStringController.text,
                            );
                            localStringController.clear();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Saved local string successfully',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text('Save'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            final localString = sharedPreferences.getString(
                              localStringKey,
                            );
                            localStringController.text =
                                localString ?? 'Failed to load';
                          },
                          child: Text('Load'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 128.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Set secure String:'),
                        Expanded(
                          child: TextFormField(
                            maxLength: 50,
                            maxLines: 1,
                            controller: secureStringController,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final FlutterSecureStorage secureStorage =
                                FlutterSecureStorage();
                            await secureStorage.write(
                              key: secureStringKey,
                              value: secureStringController.text,
                            );
                            secureStringController.clear();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Saved secure string successfully',
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text('Save'),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            final FlutterSecureStorage secureStorage =
                                FlutterSecureStorage();
                            final secureString = await secureStorage.read(
                              key: secureStringKey,
                            );
                            secureStringController.text =
                                secureString ?? 'Failed to load';
                          },
                          child: Text('Load'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
