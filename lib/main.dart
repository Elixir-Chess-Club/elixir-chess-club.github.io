import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_contacts/properties/address.dart';
import 'package:flutter_contacts/properties/email.dart';
import 'package:flutter_contacts/properties/name.dart';
import 'package:flutter_contacts/properties/phone.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elixir Chess Club',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
          color: Color.fromARGB(255, 98, 161, 216),
        )),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Elixir Chess Club Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final adminContact = Contact(
      name: Name(first: 'AnhQuan', last: 'Nguyen'),
      phones: [Phone('(714) 803-9902')],
      emails: [Email('j4qfrost@gmail.com')]);

  final locationContact = Contact(name: Name(first: 'Cire'), phones: [
    Phone('(702) 518-8697')
  ], emails: [
    Email('elixirteabar@gmail.com')
  ], addresses: [
    Address('1779 Newport Blvd, 2nd Floor, Costa Mesa CA 92627')
  ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const Text(
              'Under Construction',
              textScaler: TextScaler.linear(5.0),
            ),
            Image.asset('assets/elixir_chess_club.png'),
            const Text(
              'Chess club meets Wednesday nights 7pm at Elixir Teabar.',
            ),
            FractionallySizedBox(
              widthFactor: 0.25,
              child: Column(
                children: [
                  const Divider(
                    height: 25.0,
                  ),
                  const Text(
                    'Contact',
                    textScaler: TextScaler.linear(2.0),
                  ),
                  const Text(
                    'Location',
                  ),
                  Card(
                    color: Theme.of(context).colorScheme.primary,
                    margin: const EdgeInsets.only(top: 2.0, bottom: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(locationContact.addresses.first.address),
                          Text(locationContact.phones.first.number),
                          Text(locationContact.emails.first.address),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    'Site Admin',
                  ),
                  Card(
                    color: Theme.of(context).colorScheme.primary,
                    margin: const EdgeInsets.only(top: 2.0, bottom: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                              '${adminContact.name.first} ${adminContact.name.last}'),
                          Text(adminContact.phones.first.number),
                          Text(adminContact.emails.first.address),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
