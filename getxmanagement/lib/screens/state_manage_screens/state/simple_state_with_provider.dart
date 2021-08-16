import 'package:flutter/material.dart';
import 'package:getxmanagement/screens/state_manage_screens/controller/count_controller_provider.dart';
import 'package:provider/provider.dart';

class WithProvider extends StatelessWidget {
  const WithProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Provider State Management',
            style: TextStyle(fontSize: 20.0),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CountControllerProvider>(context, listen: false)
                  .increase();
            },
            child: Text(
              '+',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Provider.of<CountControllerProvider>(context, listen: false)
                  .decrease();
            },
            child: Text(
              '-',
              style: TextStyle(fontSize: 30.0),
            ),
          ),
          //무슨 컨트롤러를 인지하고있는지
          Consumer<CountControllerProvider>(
            builder: (context, snapshot, child) {
              return Text(
                '${snapshot.count}',
                style: TextStyle(fontSize: 30.0),
              );
            },
          ),
        ],
      ),
    );
  }
}
