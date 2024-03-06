import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teste/model/tarefa.dart';

class ConteudoFormDialog extends StatefulWidget {
  final Tarefa? tarefaAtual;

  ConteudoFormDialog({Key? key, this.tarefaAtual}) : super(key: key);

  @override
  ConteudoFormDialogState createState() => ConteudoFormDialogState();
}

class ConteudoFormDialogState extends State<ConteudoFormDialog> {
  final formKey = GlobalKey<FormState>();
  final descricaoController = TextEditingController();
  final prazoController = TextEditingController();
  final _prazoFormatado = DateFormat('dd/MM/yyyy');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: descricaoController,
            decoration: const InputDecoration(labelText: 'Descrição'),
            validator: (String? valor) {
              if (valor == null || valor.isEmpty) {
                return 'Informe a descrição';
              }
              return null;
            },
          ),
          TextFormField(
            controller: prazoController,
            decoration: InputDecoration(
              labelText: 'Prazo',
              prefixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_today),
              ),
              suffixIcon: IconButton(
                onPressed: () => prazoController.clear(),
                icon: build(context),
              ),
            ),
          )
        ],
      ),
    );
  }
}
