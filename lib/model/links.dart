

class Links {
  Links(
      this.home, 
      this.search, 
      this.wallet, 
      this.cart, 
      this.wishlist, 
      this.myaccount);

  Links.fromJson(dynamic json) {
    home = json['home'];
    search = json['search'];
    wallet = json['wallet'];
    cart = json['cart'];
    wishlist = json['wishlist'];
    myaccount = json['myaccount'];
  }
  String? home;
  String? search;
  String? wallet;
  String? cart;
  String? wishlist;
  String? myaccount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['home'] = home;
    map['search'] = search;
    map['wallet'] = wallet;
    map['cart'] = cart;
    map['wishlist'] = wishlist;
    map['myaccount'] = myaccount;
    return map;
  }

}