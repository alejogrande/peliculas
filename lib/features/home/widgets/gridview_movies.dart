part of '../home_screen.dart';

class GridViewMovies extends StatelessWidget {
  final List<Result?>? items;
  const GridViewMovies({
    this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10, // Spacing between the columns
        mainAxisSpacing: 10, // Spacing between the rows
        childAspectRatio: 2 / 3,

        children: items!
            .map((e) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: e!.posterPath != null
                                  ? Container(
                                      width: double.infinity,
                                      // height: 100,
                                      // height: double.maxFinite,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(
                                            Urls.movieImage(e!.posterPath!)),
                                        fit: BoxFit.cover,
                                      )),
                                    )
                                  : Container(),
                            ),
                            SizedBox(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    e.title!,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Starts(e.voteAverage!),
                                      Text(
                                        e.voteAverage!.toString(),
                                        style: TextStyle(
                                            color: Colors.yellow[700]),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class Starts extends StatelessWidget {
  final double valoration;
  const Starts(
    this.valoration, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int rating;
    valoration != 0 ? rating = (valoration / 2).round() : rating = 1;
    return Row(
      children: List.generate(5, (index) {
        return index < rating ? buildStar() : buildEmptyStar();
      }),
    );
  }

  Widget buildStar() {
    return SvgPicture.asset(
      Assets.iconStart,
      width: 17,
      height: 17,
    );
  }

  Widget buildEmptyStar() {
    return SvgPicture.asset(
      Assets.iconStartEmpty,
      width: 17,
      height: 17,
    );
  }
}
