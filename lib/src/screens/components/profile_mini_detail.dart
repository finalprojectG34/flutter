import 'package:flutter/material.dart';

class ProfileMiniDetail extends StatelessWidget {
  const ProfileMiniDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.5),
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(color: Colors.grey),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Coveted clicks',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                          Text('Addis Ababa')
                        ],
                      )
                    ],
                  ),
                ),
                // Align(
                //   alignment: Alignment.topRight,
                //   child: Padding(
                //     padding: const EdgeInsets.only(right: 8.0, top: 8),
                //     child: InkWell(
                //       child: Container(
                //         child: const Icon(
                //           Icons.add,
                //           color: Colors.blue,
                //         ),
                //         decoration: BoxDecoration(
                //           color: Colors.white70,
                //           borderRadius: BorderRadius.circular(100),
                //         ),
                //       ),
                //       borderRadius: BorderRadius.circular(50),
                //       onTap: () {},
                //     ),
                //   ),
                // ),
                Container(
                  transform: Matrix4.translationValues(0.0, 25.0, 0.0),
                  padding: const EdgeInsets.only(left: 10),
                  child: const Align(
                    alignment: Alignment.bottomLeft,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.woolha.com/media/2020/03/eevee.png'),
                        radius: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.phone),
                SizedBox(
                  width: 5,
                ),
                Text('+251900000000'),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
