import 'package:flutter/material.dart';
import 'package:faker/faker.dart' as f;

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final sizeOf = MediaQuery.sizeOf(context);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Detail Product')),
      body: ListView(
        children: [
          Image.network(
            f.faker.image.loremPicsum(random: 5, seed: 'person'),
            height: sizeOf.height * .33,
            width: sizeOf.width,
          ),
          Padding(
            padding: .symmetric(vertical: 8.0, horizontal: 16),
            child: Text(f.faker.person.name(), style: theme.headlineMedium),
          ),
          Padding(
            padding: .symmetric(vertical: 4.0, horizontal: 16),
            child: Text(f.faker.lorem.sentences(4).join(' ')),
          ),
          Row(
            mainAxisAlignment: .spaceAround,
            children: [
              Row(children: [Icon(Icons.favorite), Text('10')]),
              Row(children: [Icon(Icons.adb), Text('10')]),
              Row(children: [Icon(Icons.email), Text('10')]),
            ],
          ),
          ListTile(
            leading: Icon(Icons.eleven_mp),
            title: Text(f.faker.company.name()),
            subtitle: Text(f.faker.lorem.sentence()),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.eleven_mp),
            title: Text(f.faker.company.name()),
            subtitle: Text(f.faker.lorem.sentence()),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.eleven_mp),
            title: Text(f.faker.company.name()),
            subtitle: Text(f.faker.lorem.sentence()),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.eleven_mp),
            title: Text(f.faker.company.name()),
            subtitle: Text(f.faker.lorem.sentence()),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            leading: Icon(Icons.eleven_mp),
            title: Text(f.faker.company.name()),
            subtitle: Text(f.faker.lorem.sentence()),
            trailing: Icon(Icons.arrow_forward),
          ),


        ],
      ),
    );
  }
}
