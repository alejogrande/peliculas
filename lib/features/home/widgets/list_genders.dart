part of '../home_screen.dart';

class ListGenres extends StatefulWidget {
  final List<Genre?> list;

  ListGenres({required this.list, super.key, this.selected});
  String? selected;

  @override
  State<ListGenres> createState() => _ListGenresState();
}

class _ListGenresState extends State<ListGenres> {
  @override
  Widget build(BuildContext context) {
    if (widget.selected == null) {
      widget.selected = widget.list.first!.id!.toString();
      context.read<MoviesGenresBloc>().add(LoadMoviesGenres(widget.selected!));
    }
    // return Scaffold(
    return SizedBox(
      height: 60,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: widget.list
            .map((e) => Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 22, right: 5),
                  child: ElevatedButton(
                    onPressed: () {
                      if (widget.selected != e.id!.toString()) {
                        setState(() {
                          widget.selected = e.id!.toString();
                          context
                              .read<MoviesGenresBloc>()
                              .add(LoadMoviesGenres(e.id!.toString()));
                        });
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),

                      backgroundColor: e!.id!.toString() == widget.selected
                          ? MaterialStateProperty.all<Color>(Colors.blue)
                          : MaterialStateProperty.all<Color>(AppColors.black3),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(140, 30)),

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
