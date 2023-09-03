enum AppPage {
  //* Auth Pages
  login(
    path: '/login',
    name: 'Login',
  ),

  //* Home Pages
  home(
    path: '/home',
    name: 'Home',
  ),

  //* Items Pages
  items(
    path: '/items',
    name: 'Items Page',
  ),

  //* Favorite Pages
  favorite(
    path: '/favorite',
    name: 'Favorite Page',
  ),

  //* Acount Pages
  account(
    path: '/account',
    name: 'Account Page',
  ),
  accountDetails(
    path: '/account-details',
    name: 'Account Page Details',
  ),

  //* Error Page
  error(
    path: '/error',
    name: 'Error',
  );

  final String path;
  final String name;

  const AppPage({required this.path, required this.name});
}
