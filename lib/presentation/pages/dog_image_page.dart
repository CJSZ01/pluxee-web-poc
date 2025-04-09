import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/dog_provider.dart';

class DogImagePage extends StatelessWidget {
  const DogImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DogProvider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Dog Image')),
      body: Center(
        child:
            provider.isLoading
                ? const CircularProgressIndicator()
                : provider.error != null
                ? Text(provider.error!)
                : provider.dogImage == null
                ? const Text('No data')
                : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(provider.dogImage!.imageUrl),
                    const SizedBox(height: 16),
                    Text(provider.dogImage!.status),
                  ],
                ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => provider.getDogImage(),

        child: const Icon(Icons.refresh),
      ),
    );
  }
}
