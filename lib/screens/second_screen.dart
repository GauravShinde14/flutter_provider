import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providerss/list_view_provider.dart';
import 'package:providers/screens/update_data.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listview"),
      ),
      body: Consumer<ListViewProvider>(builder: (ctx, value, child) {
        var allData = value.getData();
        return value.getData().isNotEmpty
            ? ListView.builder(
                itemCount: allData.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text("${allData[index]['name']}"),
                    subtitle: Text("${allData[index]['surname']}"),
                    trailing: SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateData(
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                              icon: Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                value.deletedata(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    ),
                  );
                })
            : const Center(child: Text("no data "));
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<ListViewProvider>()
              .addData({"name": "gaurav", "surname": "shinde"});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
