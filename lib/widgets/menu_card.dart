import 'package:flutter/material.dart';

class MenuCard extends StatefulWidget {

  final String title;

  final String subtitle;

  final IconData icon;

  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  State<MenuCard> createState() =>
      _MenuCardState();
}

class _MenuCardState
    extends State<MenuCard> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      onEnter: (_) {

        setState(() {
          isHovered = true;
        });
      },

      onExit: (_) {

        setState(() {
          isHovered = false;
        });
      },

      child: AnimatedContainer(

        duration:
            const Duration(
          milliseconds: 200,
        ),

        transform:
            Matrix4.identity()
              ..scale(
                isHovered
                    ? 1.02
                    : 1.0,
              ),

        child: Card(

          elevation:
              isHovered ? 8 : 3,

          child: InkWell(

            borderRadius:
                BorderRadius.circular(
              18,
            ),

            onTap: widget.onTap,

            child: Padding(

              padding:
                  const EdgeInsets.all(
                20,
              ),

              child: Row(

                children: [

                  AnimatedContainer(

                    duration:
                        const Duration(
                      milliseconds: 200,
                    ),

                    padding:
                        const EdgeInsets
                            .all(16),

                    decoration:
                        BoxDecoration(

                      color:
                          isHovered
                              ? Colors.blue
                                  .withOpacity(
                                  0.2,
                                )
                              : Colors.blue
                                  .withOpacity(
                                  0.1,
                                ),

                      borderRadius:
                          BorderRadius
                              .circular(
                        16,
                      ),
                    ),

                    child: Icon(
                      widget.icon,
                      size: 38,
                      color: Colors.blue,
                    ),
                  ),

                  const SizedBox(
                    width: 20,
                  ),

                  Expanded(

                    child: Column(

                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,

                      children: [

                        Text(
                          widget.title,

                          style:
                              const TextStyle(
                            fontSize: 20,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        Text(
                          widget.subtitle,

                          style: TextStyle(
                            color:
                                Colors.grey[
                                    700],
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  AnimatedRotation(

                    duration:
                        const Duration(
                      milliseconds: 200,
                    ),

                    turns:
                        isHovered
                            ? 0.08
                            : 0,

                    child: const Icon(
                      Icons
                          .arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}