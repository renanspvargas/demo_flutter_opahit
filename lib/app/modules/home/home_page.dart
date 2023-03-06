import 'package:flutter/material.dart';
import 'package:lucky_investor/app/core/state/lucky_investor_state.dart';
import 'package:lucky_investor/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends LuckyInvestorState<HomePage, HomeController> {
  final _stockFieldController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _stockFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home page')),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                key: _formKey,
                controller: _stockFieldController,
                decoration: InputDecoration(
                  labelText: 'Digite o código do ativo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.getStockData(
                      stockCode: _stockFieldController.text);
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: const Text('Pesquisar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
