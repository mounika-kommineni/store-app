import 'package:flutter/material.dart';

class CategortText extends StatelessWidget {
  CategortText({super.key});
  final List<String> _categorylable = [
    'food',
    'vegetable',
    'egg',
    'tea',
    'coffee',
    'coffee',
    'coffee',
    'coffee',
    'coffee',
    'coffee',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _categorylable.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ActionChip(
                            backgroundColor: Colors.yellow.shade900,
                            onPressed: () {},
                            label: Center(
                              child: Text(
                                _categorylable[index],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_forward_ios))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
