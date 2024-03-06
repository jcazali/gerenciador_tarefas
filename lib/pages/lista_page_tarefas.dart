import 'package:flutter/material.dart';
import 'package:teste/model/tarefa.dart';

class ListaTarefaPage extends StatefulWidget {
  @override
  _ListaTarefaPageState createState() => _ListaTarefaPageState();
}

class _ListaTarefaPageState extends State<ListaTarefaPage> {
  final _tarefas = <Tarefa>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _criarAppBar(context),
      body: _criarBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Nova Tarefa',
        child: const Icon(Icons.add),
      ),
    );
  }

  AppBar _criarAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      title: const Text('Tarefas'),
      centerTitle: false,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list))
      ],
    );
  }

  Widget _criarBody() {
    if (_tarefas.isEmpty) {
      return const Center(
        child: Text(
          'Tudo certo por aqui',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        final tarefa = _tarefas[index];
        return ListTile(
          title: Text('${tarefa.id} - ${tarefa.descricao}'),
          subtitle: Text('Prazo - ${tarefa.prazoFormatado}'),
        );
      },
      separatorBuilder: (BuildContext context, index) => const Divider(),
      itemCount: _tarefas.length,
    );
  }
}
