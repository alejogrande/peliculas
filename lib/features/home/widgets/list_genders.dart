part of '../home_screen.dart';

class ListGenres extends StatelessWidget {
  final List<Genre?> list;
  const ListGenres({
    required this.list,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: list!
            .map((e) => Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, left: 22, right: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      fixedSize: MaterialStateProperty.all<Size>(Size(150, 50)),

                      // O bien, puedes utilizar minimumSize
                      // minimumSize: MaterialStateProperty.all<Size>(Size(200, 50)),
                    ),
                    child: Text(e!.name!),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
