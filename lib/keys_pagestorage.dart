import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Page Storage Key';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  text: 'ListView',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ListViewPageStorageKeyPage(),
                  )),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'GridView',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GridViewPageStorageKeyPage(),
                  )),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'ExpansionTile',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExpansionPageStorageKeyPage(),
                  )),
                ),
                const SizedBox(height: 16),
                ButtonWidget(
                  text: 'PageStorage',
                  onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PersistPageStoragePage(),
                  )),
                ),
              ],
            ),
          ),
        ),
      );
}

class BasicTile {
  final String title;
  final List<BasicTile> tiles;

  const BasicTile({
    required this.title,
    this.tiles = const [],
  });
}

class BasicTileWidget extends StatelessWidget {
  final BasicTile tile;

  const BasicTileWidget({
    super.key,
    required this.tile,
  });

  @override
  Widget build(BuildContext context) {
    final title = tile.title;
    final tiles = tile.tiles;

    if (tiles.isEmpty) {
      return ListTile(
        title: Text(title),
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: Theme.of(context).primaryColor),
        ),
        child: ExpansionTile(
          key: PageStorageKey(title),
          title: Text(title),
          children: tiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
        ),
      );
    }
  }
}

final basicTiles = <BasicTile>[
  const BasicTile(title: 'Countries', tiles: [
    BasicTile(title: 'Russia'),
    BasicTile(title: 'Canada'),
    BasicTile(title: 'USA'),
    BasicTile(title: 'China'),
    BasicTile(title: 'China'),
    BasicTile(title: 'Australia'),
    BasicTile(title: 'India'),
    BasicTile(title: 'Argentina'),
  ]),
  BasicTile(title: 'Dates', tiles: [
    BasicTile(title: '2020', tiles: buildMonths()),
    BasicTile(title: '2021', tiles: buildMonths()),
    const BasicTile(title: '2022'),
    const BasicTile(title: '2023'),
  ]),
];

List<BasicTile> buildMonths() => [
      'January',
      'February',
      'March',
      'April',
      'November',
      'December',
    ].map<BasicTile>(buildMonth).toList();

BasicTile buildMonth(String month) => BasicTile(
      title: month,
      tiles: List.generate(28, (index) => BasicTile(title: '$index.')),
    );

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: onClicked,
        child: Text(text, style: const TextStyle(fontSize: 20)),
      );
}

class ListViewPageStorageKeyPage extends StatefulWidget {
  const ListViewPageStorageKeyPage({super.key});

  @override
  createState() => _ListViewPageStorageKeyPageState();
}

class _ListViewPageStorageKeyPageState
    extends State<ListViewPageStorageKeyPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
        ),
        body: buildPages(),
        bottomNavigationBar: buildBottomBar(),
      );

  Widget buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.clear),
          label: 'ListView',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          label: 'Key ListView',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return buildPageOne();
      case 1:
        return buildPageTwo();
      default:
        return Container();
    }
  }

  Widget buildPageOne() => ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'List item ${index + 1}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      );

  Widget buildPageTwo() => ListView.builder(
        key: const PageStorageKey<String>('pageTwo'),
        itemCount: 40,
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'List item ${index + 1}',
            style: const TextStyle(fontSize: 24),
          ),
        ),
      );
}

class GridViewPageStorageKeyPage extends StatefulWidget {
  const GridViewPageStorageKeyPage({super.key});

  @override
  createState() => _GridViewPageStorageKeyPageState();
}

class _GridViewPageStorageKeyPageState
    extends State<GridViewPageStorageKeyPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => GridViewPageStorageKeyPage(),
              )),
            ),
          ],
        ),
        body: buildPages(),
        bottomNavigationBar: buildBottomBar(),
      );

  Widget buildBottomBar() {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.clear),
          label: 'GridView',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.done),
          label: 'Key GridView',
        ),
      ],
      onTap: (int index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return buildPageOne();
      case 1:
        return buildPageTwo();
      default:
        return Container();
    }
  }

  Widget buildPageOne() => GridView.builder(
        itemCount: 40,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => GridTile(
          child: Center(
            child: Text(
              'Grid item ${index + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      );

  Widget buildPageTwo() => GridView.builder(
        key: const PageStorageKey<String>('pageTwo'),
        itemCount: 40,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) => GridTile(
          child: Center(
            child: Text(
              'Grid item ${index + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
}

class ExpansionPageStorageKeyPage extends StatelessWidget {
  const ExpansionPageStorageKeyPage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(MyApp.title),
            centerTitle: true,
            bottom: const TabBar(
              indicatorColor: Colors.white,
              indicatorWeight: 5,
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.settings), text: 'Settings'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildPageOne(),
              buildPageTwo(),
            ],
          ),
        ),
      );

  Widget buildPageOne() => ListView(
        children:
            basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
      );

  Widget buildPageTwo() => ListView(
        key: const PageStorageKey<String>('pageTwo'),
        children:
            basicTiles.map((tile) => BasicTileWidget(tile: tile)).toList(),
      );
}

final bucketGlobal = PageStorageBucket();

class PersistPageStoragePage extends StatefulWidget {
  const PersistPageStoragePage({super.key});

  @override
  createState() => _PersistPageStoragePageState();
}

class _PersistPageStoragePageState extends State<PersistPageStoragePage> {
  int index = 0;

  @override
  void initState() {
    super.initState();

    final state =
        PageStorage.of(context).readState(context, identifier: 'pageOne');
    print(state);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(MyApp.title),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PersistPageStoragePage(),
              )),
            ),
          ],
        ),
        body: buildPageOne(),
      );

  Widget buildPageOne() => PageStorage(
        bucket: bucketGlobal,
        child: ListView.builder(
          key: const PageStorageKey<String>('pageOne'),
          itemCount: 40,
          itemBuilder: (context, index) => ListTile(
            title: Text(
              'List item ${index + 1}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ),
      );
}
