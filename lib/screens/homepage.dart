import 'package:curdoprate/screens/serviceapi.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ServiceApi serviceApi = ServiceApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CURD OPERATION'),
        backgroundColor: Colors.purple,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // String? email;
          // String? first_name;
          // String? last_name;
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => AlertDialog(
                    content: Form(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.green,
                              labelText: "Title"),
                          onChanged: (val) {
                            val;
                          },
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.grey,
                              labelText: 'Content'),
                          onChanged: (_val) {
                            title:
                            _val;
                          },
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Add'))
                      ],
                    )),
                  ));
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<List>(
        future: serviceApi.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.length == 0) {
              return const Center(child: Text('HAS NO DATA '));
            }
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index]['email']),
                    subtitle: Text(snapshot.data?[index]['first_name']),
                    leading: Text(snapshot.data?[index]['last_name']),
                  );
                });
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
