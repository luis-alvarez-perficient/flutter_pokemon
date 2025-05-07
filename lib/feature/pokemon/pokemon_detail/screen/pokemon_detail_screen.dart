import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final String name;
  final String image;

  const PokemonDetailScreen({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PokemonSliver(name: name, image: image),
    );
  }
}

class PokemonSliver extends StatelessWidget {
  final String name;
  final String image;
  const PokemonSliver({super.key, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //Sliver App Bar
        CustomSliverAppBar(name: name, image: image),

        //Sliver Items
        PowerSkillsBoxAdapter(),
      ],
    );
  }
}

class CustomSliverAppBar extends StatelessWidget {
  final String name;
  final String image;

  const CustomSliverAppBar({
    super.key,
    required this.name,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      pinned: true,
      floating: true,
      // leading: Icon(Icons.menu),
      expandedHeight: 250,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(name),
        collapseMode: CollapseMode.parallax,
        background: Hero(
          tag: name,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Image.network(image, fit: BoxFit.scaleDown, scale: 2),
          ),
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      shadowColor: Colors.black,
    );
  }
}

class PowerSkillsBoxAdapter extends StatelessWidget {
  const PowerSkillsBoxAdapter({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const [
            BoxShadow(
              spreadRadius: 1,
              color: Colors.black26,
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        margin: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text('Powers', style: TextStyle(fontSize: 24)),
            PowerSkill(
              value: 150,
              totalValue: 300,
              label: 'HP',
              valueColor: Colors.red,
              backgroundColor: Colors.white,
            ),
            PowerSkill(
              value: 300,
              totalValue: 300,
              label: 'ATK',
              valueColor: Colors.orange,
              backgroundColor: Colors.white,
            ),
            PowerSkill(
              value: 250,
              totalValue: 300,
              label: 'DEF',
              valueColor: Colors.blue,
              backgroundColor: Colors.white,
            ),
            PowerSkill(
              value: 70,
              totalValue: 300,
              label: 'SPD',
              valueColor: const Color.fromARGB(255, 93, 129, 171),
              backgroundColor: Colors.white,
            ),
            PowerSkill(
              value: 419,
              totalValue: 1000,
              label: 'EXP',
              valueColor: Colors.green,
              backgroundColor: Colors.white,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class PowerSkill extends StatelessWidget {
  final double value;
  final double totalValue;
  final String label;
  final Color valueColor;
  final Color backgroundColor;

  const PowerSkill({
    super.key,
    required this.value,
    required this.totalValue,
    required this.label,
    required this.valueColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 80,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Text(label, style: TextStyle(fontSize: 22)),
        ),
        Expanded(
          child: Container(
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: CustomLinearProgress(
              value: value,
              totalValue: totalValue,
              valueColor: valueColor,
              backgroundColor: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}

class CustomLinearProgress extends StatelessWidget {
  final double value;
  final double totalValue;
  final Color valueColor;
  final Color backgroundColor;

  const CustomLinearProgress({
    super.key,
    required this.value,
    required this.totalValue,
    required this.valueColor,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          // width: 100,
          width: MediaQuery.of(context).size.width - 100,
          child: LinearProgressIndicator(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            value: value / totalValue,
            backgroundColor: Colors.white,
            valueColor: AlwaysStoppedAnimation<Color>(valueColor),
            color: Colors.amber,
            semanticsValue: '0',
            minHeight: 25,
            semanticsLabel: 'Linear progress indicator',
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text(
            "${value.round()}/${totalValue.round()}",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
        ),
      ],
    );
  }
}
