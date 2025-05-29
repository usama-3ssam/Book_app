import 'package:book_app/Features/auth/presentation/views/login_view.dart';
import 'package:book_app/Features/home/data/models/book_model/book_model.dart';
import 'package:book_app/Features/home/data/repos/repo_imple.dart';
import 'package:book_app/Features/home/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:book_app/Features/home/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:book_app/Features/home/manger/similler_books_cubit/similler_books_cubit.dart';
import 'package:book_app/Features/search/presentation/manger/search_cubit/search_cubit_cubit.dart';
import 'package:book_app/core/services/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../Features/home/presentation/views/book_details_view.dart';
import '../../Features/home/presentation/views/home_view.dart';
import '../../Features/search/presentation/views/search_view.dart';
import '../../Features/splash/presentation/views/splashview.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kLoginView = '/loginView';
  static const kSignupView = '/signupView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => FeatureBooksCubit(
                getIt.get<HomeRepoImpl>(),
              )..feachFeatureBooks(),
            ),
            BlocProvider(
              create: (context) => NewestBooksCubit(
                getIt.get<HomeRepoImpl>(),
              )..feachNewestBooks(),
            ),
          ],
          child: const HomeView(),
        ),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimillerBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(
            books: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: const SearchView(),
        ),
      ),
    ],
  );
}
