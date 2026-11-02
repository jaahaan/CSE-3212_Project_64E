import 'package:flutter/material.dart';
import 'package:project_64e/widget/input_field.dart';

class ConverterPage extends StatefulWidget {
  const ConverterPage({super.key});

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double result = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converter"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Card(
            color: const Color.fromARGB(255, 255, 146, 182),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("USD"),
                      Icon(Icons.swap_horiz),
                      Text("BDT"),
                    ],
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputField(
                          controller: controller,
                          keyboardType: TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          labelText: "Amount",
                          hintText: "Enter Amount",
                          prefixIcon: Icon(Icons.monetization_on),
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Field is Empty!!";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              String input = controller.text;
                              result = double.parse(input) * 124.34;
                              setState(() {});
                            }
                          },
                          child: Text("Convert"),
                        ),
                        SizedBox(height: 20),
                        Text("BDT: $result"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
