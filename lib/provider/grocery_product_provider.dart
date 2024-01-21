import 'package:flutter_challenge_grocery_store_animation/model/grocery_product.dart';
import 'package:riverpod/riverpod.dart';

final groceryProductProvider = Provider(
  (ref) => [
    GroceryProduct(
        price: 8.30,
        name: 'Blueberries',
        description:
            'The avocado is a tree originating in the Americas which is likely native to the highland regions of south-central '
            'Mexico to Guatemala. It is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also '
            'called an avocado, is botanically a large berry containing a single large seed.',
        image: 'assets/images/fruit/blueberries.png',
        weight: '500g'),
    GroceryProduct(
        price: 11.00,
        name: 'Banana',
        description:
            'A banana is an elongated, edible fruit – botanically a berry – produced by several kinds of large herbaceous'
            ' flowering plants in the genus Musa. In some countries, bananas used for cooking may be called "plantains", distinguishing '
            'them from dessert bananas.',
        image: 'assets/images/fruit/banana.png',
        weight: '1000g'),
    GroceryProduct(
        price: 15.40,
        name: 'Mango',
        description:
            'A mango is an edible stone fruit produced by the tropical tree Mangifera indica which is believed to have originated '
            'from the region between northwestern Myanmar, Bangladesh, and northeastern India.',
        image: 'assets/images/fruit/mango.png',
        weight: '500g'),
    GroceryProduct(
        price: 20.00,
        name: 'Watermelon',
        description:
            'Watermelon is a flowering plant species of the Cucurbitaceae family and the name of its edible fruit. A scrambling'
            ' and trailing vine-like plant, it is a highly cultivated fruit worldwide, with more than 1,000 varieties.',
        image: 'assets/images/fruit/watermelon.png',
        weight: '2500g'),
    GroceryProduct(
        price: 18.50,
        name: 'Pear',
        description:
            'Pears are fruits produced and consumed around the world, growing on a tree and harvested in the Northern Hemisphere'
            ' in late summer into October. The pear tree and shrub are a species of genus Pyrus, in the family Rosaceae, bearing the '
            'pomaceous fruit of the same name.',
        image: 'assets/images/fruit/pear.png',
        weight: '200g'),
    GroceryProduct(
        price: 17.34,
        name: 'Raspberries',
        description:
            'The tomato is the edible berry of the plant Solanum lycopersicum, commonly known as the tomato plant. The species '
            'originated in western South America, Mexico, and Central America. The Mexican Nahuatl word tomatl gave rise to the Spanish '
            'word tomate, from which the English word tomato derived.',
        image: 'assets/images/fruit/raspberries.png',
        weight: '500g'),
    GroceryProduct(
        price: 22.00,
        name: 'Apple',
        description:
            'An apple is an edible fruit produced by an apple tree. Apple trees are cultivated worldwide and are the most '
            'widely grown species in the genus Malus. The tree originated in Central Asia, where its wild ancestor, Malus sieversii, '
            'is still found today.',
        image: 'assets/images/fruit/apple.png',
        weight: '700g'),
    GroceryProduct(
        price: 25.50,
        name: 'Orange',
        description:
            'An orange is a fruit of various citrus species in the family Rutaceae; it primarily refers to Citrus × sinensis,'
            ' which is also called sweet orange, to distinguish it from the related Citrus × aurantium, referred to as bitter orange.',
        image: 'assets/images/fruit/orange.png',
        weight: '500g'),
    GroceryProduct(
        price: 14.00,
        name: 'Pineapple',
        description:
            'The pineapple is a tropical plant with an edible fruit; it is the most economically significant plant in the'
            ' family Bromeliaceae. The pineapple is indigenous to South America, where it has been cultivated for many centuries.',
        image: 'assets/images/fruit/pineapple.png',
        weight: '250g'),
    GroceryProduct(
        price: 7.00,
        name: 'Guava',
        description:
            'Guava is a common tropical fruit cultivated in many tropical and subtropical regions. The common guava Psidium'
            ' guajava is a small tree in the myrtle family, native to Mexico, Central America, the Caribbean and northern South America.',
        image: 'assets/images/fruit/guava.png',
        weight: '500g'),
  ],
);
