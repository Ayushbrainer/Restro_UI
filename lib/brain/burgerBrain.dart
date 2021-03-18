class burgerProduct{
  var burgerId;
  var noOfBurgers = 0;
  var burgerImage;
  var burgerName,burgerDescription,burgerOffer;
  burgerProduct({this.burgerId,this.noOfBurgers,this.burgerImage,this.burgerName,this.burgerDescription,this.burgerOffer});
}

burgerProduct burger0 = burgerProduct(
    burgerId: 0,
    noOfBurgers: 0
);
burgerProduct burger1 = burgerProduct(
    burgerId: 1,
    noOfBurgers: 0,
    burgerImage: "Assets/b1.png",
  burgerDescription: "Onion with Cheese",
  burgerName: "Burger 1",
  burgerOffer: "Enjoy 90% OFF with promo code 'NEW'"
);

burgerProduct burger2 = burgerProduct(
    burgerId: 2,
    noOfBurgers: 0,
    burgerImage: "Assets/b2.png",
  burgerName: "Burger 2",
  burgerDescription: "Cheese with chicken",
  burgerOffer: "Enjoy 80% OFF with promo code 'NEW'"

);

burgerProduct burger3 = burgerProduct(
    burgerId: 3,
    noOfBurgers: 0,
    burgerImage: "Assets/b3.png",
  burgerName: "Burger 3",
  burgerOffer: "Enjoy 75% OFF with promo code 'NEW'",
  burgerDescription: "Onion with Cheese"
);

burgerProduct burger4 = burgerProduct(
    burgerId: 4,
    noOfBurgers: 0,
    burgerImage: "Assets/b4.png",
  burgerOffer: "Enjoy 80% OFF with promo code 'NEW'",
  burgerDescription: "Onion with Cheese",
  burgerName: "Burger 4"
);

burgerProduct burger5 = burgerProduct(
    burgerId: 5,
    noOfBurgers: 0,
    burgerImage: "Assets/b5.png",
  burgerName: "Burger 5",
  burgerDescription: "Onion with Cheese",
  burgerOffer: "Enjoy 69% OFF with promo code 'NEW'"
);

List<burgerProduct> burgerorder = [
  burger0,
  burger1,
  burger2,
  burger3,
  burger4,
  burger5
];