import 'package:flutter/widgets.dart';
import 'package:slatarahim/classes/language.dart';

class AddFamily extends StatelessWidget {
  const AddFamily({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        trans(context).comingSoon,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}
