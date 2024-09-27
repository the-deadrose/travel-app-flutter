import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app_flutter/core/api/api_url.dart';
import 'package:travel_app_flutter/features/detail/presentation/bloc/detail_bloc.dart';
import 'package:travel_app_flutter/features/home/data/model/destination_model.dart';
import 'package:travel_app_flutter/features/home/data/model/inspiration_model.dart';
import 'package:travel_app_flutter/features/home/data/model/popular_model.dart';
import 'package:travel_app_flutter/features/home/presentation/bloc/home_bloc.dart';
import 'package:travel_app_flutter/model/category_model.dart';
import 'package:travel_app_flutter/model/people_like_model.dart';
import 'package:travel_app_flutter/features/detail/presentation/page/detail_page.dart';
import 'package:travel_app_flutter/features/navbar/presentation/pages/main_wrapper.dart';
import 'package:travel_app_flutter/features/home/presentation/widgets/circular_tabbar_indicator.dart';
import 'package:travel_app_flutter/features/home/presentation/widgets/middle_app_text.dart';
import 'package:travel_app_flutter/core/widgets/reusable_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  final EdgeInsetsGeometry padding =
      const EdgeInsets.symmetric(horizontal: 10.0);

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    context.read<HomeBloc>().add(GetHomePageData());
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(size),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Padding(
            padding: padding,
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(GetHomePageData());
              },
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInUp(
                      delay: const Duration(milliseconds: 300),
                      child: const AppText(
                        text: "Top Tours",
                        size: 35,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 400),
                      child: const AppText(
                        text: "For Your Request",
                        size: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: size.height * 0.01,
                            top: size.height * 0.02),
                        child: TextField(
                          style: GoogleFonts.ubuntu(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 240, 240),
                            prefixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.filter_alt_outlined,
                                color: Colors.grey,
                              ),
                            ),
                            hintStyle: GoogleFonts.ubuntu(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                            hintText: "Discover City",
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 600),
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        width: size.width,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            overlayColor:
                                WidgetStateProperty.all(Colors.transparent),
                            labelPadding: EdgeInsets.only(
                                left: size.width * 0.05,
                                right: size.width * 0.05),
                            controller: tabController,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: const CircleTabBarIndicator(
                              color: Color(0xff1A434E),
                              radius: 4,
                            ),
                            tabs: const [
                              Tab(
                                text: "Places",
                              ),
                              Tab(text: "Inspiration"),
                              Tab(text: "Popular"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    FadeInUp(
                      delay: const Duration(milliseconds: 700),
                      child: BlocBuilder<HomeBloc, HomeState>(
                        builder: (context, state) {
                          print(state is HomeLoaded);
                          if (state is HomeLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is HomeLoaded) {
                            return Container(
                              margin: EdgeInsets.only(top: size.height * 0.01),
                              width: size.width,
                              height: size.height * 0.4,
                              child: TabBarView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  controller: tabController,
                                  children: [
                                    TabViewChild(
                                        destination: state.destinationModel,
                                        inspiration: state.inspirationModel,
                                        popular: state.popularModel,
                                        type: 'Destination'),
                                    TabViewChild(
                                        destination: state.destinationModel,
                                        inspiration: state.inspirationModel,
                                        popular: state.popularModel,
                                        type: 'Inspiration'),
                                    TabViewChild(
                                        destination: state.destinationModel,
                                        inspiration: state.inspirationModel,
                                        popular: state.popularModel,
                                        type: 'Popular'),
                                  ]),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    FadeInUp(
                        delay: const Duration(milliseconds: 800),
                        child: const MiddleAppText(text: "Find More")),
                    FadeInUp(
                      delay: const Duration(milliseconds: 900),
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.01),
                        width: size.width,
                        height: size.height * 0.12,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryComponents.length,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              Category current = categoryComponents[index];
                              return Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(10.0),
                                    width: size.width * 0.16,
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                      color: const Color(0xff1A434E)
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image(
                                        image: AssetImage(
                                          current.image,
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  AppText(
                                    text: current.name,
                                    size: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  )
                                ],
                              );
                            }),
                      ),
                    ),
                    FadeInUp(
                        delay: const Duration(milliseconds: 1000),
                        child: const MiddleAppText(text: "People Also Like")),
                    FadeInUp(
                      delay: const Duration(milliseconds: 1100),
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.01),
                        width: size.width,
                        height: size.height * 0.68,
                        child: ListView.builder(
                            itemCount: peopleAlsoLikeModel.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              PeopleAlsoLikeModel current =
                                  peopleAlsoLikeModel[index];
                              return GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                      personData: current,
                                      isCameFromPersonSection: true,
                                    ),
                                  ),
                                ),
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  width: size.width,
                                  height: size.height * 0.15,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Hero(
                                        tag: current.day,
                                        child: Container(
                                          margin: const EdgeInsets.all(8.0),
                                          width: size.width * 0.28,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                current.image,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * 0.02),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.035,
                                            ),
                                            AppText(
                                              text: current.title,
                                              size: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            SizedBox(
                                              height: size.height * 0.005,
                                            ),
                                            AppText(
                                              text: current.location,
                                              size: 14,
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w300,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.015),
                                              child: AppText(
                                                text: "${current.day} Day",
                                                size: 14,
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSize _buildAppBar(Size size) {
    return PreferredSize(
      preferredSize: Size.fromHeight(size.height * 0.09),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 5,
              ),
              child: GestureDetector(
                onTap: (() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MainWrapper()))),
                child: const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/main.jpg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabViewChild extends StatelessWidget {
  const TabViewChild({
    required this.destination,
    required this.inspiration,
    required this.popular,
    required this.type,
    super.key,
  });

  final DestinationModel destination;
  final InspirationModel inspiration;
  final PopularModel popular;
  final String type;

  @override
  Widget build(BuildContext context) {
    print(type);
    print(type == 'Destination'
        ? destination.results.first.name
        : type == 'Inspiration'
            ? inspiration.results?.first.name
            : popular.results.first.name);
    var size = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: type == 'Destiination'
          ? destination.results.length
          : type == 'Inspiration'
              ? inspiration.results!.length
              : popular.results.length,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        // final current = destination.results[index];
        final destinationData = destination.results[index];
        final inspirationData = inspiration.results?[index];
        final popularData = popular.results[index];
        return GestureDetector(
          onTap: () async {
            context.read<DetailBloc>().add(GetDetailData(
                id: type == 'Destination'
                    ? destinationData.id
                    : type == 'Inspiration'
                        ? inspirationData?.id ?? 0
                        : popularData.id));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailsPage(
                  personData: null,
                  isCameFromPersonSection: false,
                ),
              ),
            );
          },
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Hero(
                tag: type == 'Destination'
                    ? destinationData.images[0].toString()
                    : type == 'Inspiration'
                        ? inspirationData!.images![0].toString()
                        : popular.results[index].images[0].toString(),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(
                          '${ApiUrl.mediaUrl}${type == 'Destination' ? destinationData.images[0] : type == 'Inspiration' ? inspirationData!.images![0] : popular.results[index].images[0]}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                top: size.height * 0.2,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: size.width * 0.53,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(153, 0, 0, 0),
                        Color.fromARGB(118, 29, 29, 29),
                        Color.fromARGB(54, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.045,
                child: AppText(
                  text: type == 'Destination'
                      ? destinationData.name
                      : type == 'Inspiration'
                          ? inspirationData?.name ?? ''
                          : popularData.name,
                  size: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Positioned(
                left: size.width * 0.07,
                bottom: size.height * 0.025,
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    AppText(
                      text: type == 'Destination'
                          ? destinationData.location
                          : type == 'Inspiration'
                              ? inspirationData?.location ?? ''
                              : popularData.location,
                      size: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
