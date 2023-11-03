import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertodo/modelclass/class.dart';
import 'package:providertodo/modelclass/providerclass.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final inputtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool? checkedvalue = false;

    final object = Provider.of<Provider_class>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet<void>(
            elevation: 2 ,shape:OutlineInputBorder(borderRadius: BorderRadius.circular(20)) ,
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 300,
                          child: TextField(
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                            controller: inputtext,
                          ),
                        ),
                        ElevatedButton(
                            child: const Text('Add'),
                            onPressed: () {
                              object.addTask(inputtext.text);
                              Navigator.pop(context);
                            }),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('Groceries'),backgroundColor: Colors.deepPurple),
      body: Column(

        children: [
          Center(child: Text('Items:(${object.todo.length.toString()})',style: TextStyle(
            fontWeight: FontWeight.bold
          ),)
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: object.todo.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Checkbox(
                  value: object.todo[index].checkitem,
                    onChanged: ((_)=>object.toggleTask(object.todo[index]))),
                title: Text(object.todo[index].Text),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    object.delete(object.todo[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
