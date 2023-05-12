enum Menu {
  paymentType(
    '/payment-type/',
    'payment_type_ico.png',
    'payment_type_ico_selected.png',
    'Administrar formas de pagamento',

  ),
  products(
    '/products/',
    'products_ico.png',
    'products_ico_selected.png',
    'Administrar produtos',
  ),
  order(
    '/order/',
    'order_ico.png',
    'order_ico_selected.png',
    'Pedidos do dia',
  );

  final String route;
  final String assetIcon;
  final String assetIconSelected;
  final String label;

  const Menu(this.route, this.assetIcon, this.assetIconSelected, this.label);
}
