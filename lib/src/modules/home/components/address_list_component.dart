import 'package:flutter/material.dart';

class AddressListComponent extends StatelessWidget {
  final List<String> ceps;

  const AddressListComponent({super.key, required this.ceps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ceps.length,
      itemBuilder: (_, index) {
        return ListTile(
          leading: const Icon(Icons.location_on),
          title: Text(ceps[index]),
        );
      },
    );
  }
}
