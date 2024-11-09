import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

void main() {
  runApp(const DesktopLayoutApp());
}

class DesktopLayoutApp extends StatelessWidget {
  const DesktopLayoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
        color: Colors.white,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return const DesktopLayout();
        });
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[400],
      child: LayoutGrid(
        areas: '''
          header header   header
          nav    content  .
          nav    content  aside
          footer footer   footer
        ''', // . will show empty grey space
        // A number of extension methods are provided for concise track sizing
        columnSizes: [152.px, 1.fr, 152.px],
        rowSizes: [
          112.px,
          auto, // this is 0px because 1.fr takes up all the remaining space
          1.fr,
          64.px,
        ],
        children: [
          const Header().inGridArea('header'),
          const Navigation().inGridArea('nav'),
          const Content().inGridArea('content'),
          const Aside().inGridArea('aside'),
          const Footer().inGridArea('footer'),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) => Container(color: Colors.red);
}

class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) => Container(color: Colors.purple);
}

class Content extends StatelessWidget {
  const Content({super.key});

  @override
  Widget build(BuildContext context) => Container(color: Colors.white);
}

class Aside extends StatelessWidget {
  const Aside({super.key});

  @override
  Widget build(BuildContext context) =>
      Container(color: Colors.yellow, width: 184);
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) => Container(color: Colors.deepPurple);
}
