import 'package:flutter/material.dart';

class Weight extends StatefulWidget {
  const Weight({super.key});

  @override
  State<Weight> createState() => _WeightState();
}

class _WeightState extends State<Weight> {
  String selectedWeight = 'Up to 1 kg';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (context) => weightSheet(),
        );
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              selectedWeight,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Colors.grey[400],
              size: 21,
            )
          ],
        ),
      ),
    );
  }

  Widget weightSheet() => StatefulBuilder(builder: (context, weightState) {
        return Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(top: 8, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 5,
                    width: 40,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 20),
                  child: Text(
                    'Parcel Weight',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.grey[200],
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    weightState(() {
                      selectedWeight = 'Up to 1 kg';
                    });
                    setState(() {
                      selectedWeight = 'Up to 1 kg';
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Up to 1 kg',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        selectedWeight == 'Up to 1 kg'
                            ? const Icon(
                                Icons.done,
                                color: Color(0xff0048ff),
                                size: 28,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.grey[200],
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    weightState(() {
                      selectedWeight = 'Up to 5 kg';
                    });
                    setState(() {
                      selectedWeight = 'Up to 5 kg';
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Up to 5 kg',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        selectedWeight == 'Up to 5 kg'
                            ? const Icon(
                                Icons.done,
                                color: Color(0xff0048ff),
                                size: 28,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.grey[200],
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    weightState(() {
                      selectedWeight = 'Up to 10 kg';
                    });
                    setState(() {
                      selectedWeight = 'Up to 10 kg';
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Up to 10 kg',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        selectedWeight == 'Up to 10 kg'
                            ? const Icon(
                                Icons.done,
                                color: Color(0xff0048ff),
                                size: 28,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.grey[200],
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    weightState(() {
                      selectedWeight = 'Up to 15 kg';
                    });
                    setState(() {
                      selectedWeight = 'Up to 15 kg';
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Up to 15 kg',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        selectedWeight == 'Up to 15 kg'
                            ? const Icon(
                                Icons.done,
                                color: Color(0xff0048ff),
                                size: 28,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.grey[200],
                  highlightColor: Colors.grey[200],
                  onTap: () {
                    weightState(() {
                      selectedWeight = 'Up to 20 kg';
                    });
                    setState(() {
                      selectedWeight = 'Up to 20 kg';
                    });
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Up to 20 kg',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        selectedWeight == 'Up to 20 kg'
                            ? const Icon(
                                Icons.done,
                                color: Color(0xff0048ff),
                                size: 28,
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            )
          ],
        );
      });
}
