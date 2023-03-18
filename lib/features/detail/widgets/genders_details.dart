part of '../detail_screen.dart';

class GendersDetails extends StatelessWidget {
  final Details? details;
  const GendersDetails({
    this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: details!.genres!
                .map((e) => Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.black3,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 30,
                        // width: 100,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              e!.name!,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.black3,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 30,
              // width: 60,
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      Assets.iconStart,
                      width: 15,
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        details!.voteAverage!.toString(),
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
