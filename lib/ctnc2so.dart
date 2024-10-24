import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: FirstAppHomePage());
  }
}

class FirstAppHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FirstAppHomePageState();
  }
}

class FirstAppHomePageState extends State<FirstAppHomePage> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  String result = '';

  void calculate(String operation) {
    final double? num1 = double.tryParse(controller1.text);
    final double? num2 = double.tryParse(controller2.text);

    if (num1 == null || num2 == null) {
      setState(() {
        result = 'Vui lòng nhập số hợp lệ';
      });
      return;
    }

    double calculationResult;
    switch (operation) {
      case 'add':
        calculationResult = num1 + num2;
        break;
      case 'subtract':
        calculationResult = num1 - num2;
        break;
      case 'multiply':
        calculationResult = num1 * num2;
        break;
      case 'divide':
        if (num2 == 0) {
          setState(() {
            result = 'Không thể chia cho 0';
          });
          return;
        }
        calculationResult = num1 / num2;
        break;
      default:
        return;
    }

    setState(() {
      result = 'Kết quả: $calculationResult';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ứng dụng Cộng Trừ Nhân Chia'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: TextField(
                controller: controller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số 1',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: 200,
              child: TextField(
                controller: controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nhập số 2',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () => calculate('add'),
                ),
                FloatingActionButton(
                  child: Icon(Icons.remove),
                  onPressed: () => calculate('subtract'),
                ),
                FloatingActionButton(
                  child: Icon(Icons.clear),
                  onPressed: () => calculate('multiply'),
                ),
                FloatingActionButton(
                  child: Icon(Icons.remove_circle),
                  onPressed: () => calculate('divide'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
