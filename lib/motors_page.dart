import "package:flutter/material.dart";

class MotorsPage extends StatefulWidget {
  const MotorsPage({Key? key}) : super(key: key);

  @override
  State<MotorsPage> createState() => _MotorsPageState();
}

class _MotorsPageState extends State<MotorsPage> {
  List<bool> values = List.filled(30, true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motors Page'),
      ),
      body: ListView.builder(
        itemCount: values.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      'More features can be added here for every motor',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
              );
            },
            child: MotorWidget(
              index: index + 1,
              value: values[index],
              onChange: (value) {
                values[index] = value;
                setState(() {});
              },
            ),
          );
        },
      ),
    );
  }
}

class MotorWidget extends StatelessWidget {
  const MotorWidget({
    Key? key,
    required this.index,
    required this.value,
    required this.onChange,
  }) : super(key: key);
  final int index;
  final bool value;
  final void Function(bool)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Motor $index'),
          Switch(
            value: value,
            onChanged: onChange,
          ),
        ],
      ),
    );
  }
}
