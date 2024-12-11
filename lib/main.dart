import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:providers/providerss/counter_provider.dart';
import 'package:providers/providerss/list_view_provider.dart';
import 'package:providers/screens/second_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
          create: (_) => CounterProvider(),
        ),
        ChangeNotifierProvider<ListViewProvider>(
          create: (_) => ListViewProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: ChangeNotifierProvider<CounterProvider>(
      //   create: (context) => CounterProvider(),
      //   child: const HomePage(),
      // ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        // this also works but it rebuild whole widget so this is not efficient.
        // child: Text(
        //   "${Provider.of<CounterProvider>(context, listen: true).getCount()}",
        //   style: const TextStyle(fontSize: 30),
        // ),
        // to solve this problem use Consumers which will consume the data .
        child: Consumer<CounterProvider>(
          builder: (ctx, _, __) => Text(
            "${ctx.watch<CounterProvider>().getCount()}",
            style: const TextStyle(fontSize: 30),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              // setState(() {
              //   _count += 1;
              // });
              // Provider.of<CounterProvider>(context, listen: false).increment();
              // can also be written as
              context.read<CounterProvider>().increment();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              if (Provider.of<CounterProvider>(context, listen: false)
                      .getCount() <=
                  0) {
              } else {
                context.read<CounterProvider>().decrement();
              }
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              // open listview
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ),
              );
            },
            child: Icon(Icons.next_plan),
          )
        ],
      ),
    );
  }
}
