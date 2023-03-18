part of '../home_screen.dart';

class CarouselSliderCustom extends StatelessWidget {
  final List<Result?>? items;
  const CarouselSliderCustom({
    this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items
            ?.map((e) => Padding(
                  padding: const EdgeInsets.all(12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        context
                            .read<DetailBloc>()
                            .add(LoadDetails(e.id!.toString()));
                        Navigator.pushNamed(context, Routes.detail);
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            Urls.movieImage(e!.backdropPath!),
                            width: 1000,
                            height: 300,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          enableInfiniteScroll: false,
        ));
  }
}
