import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
final TextEditingController controller = TextEditingController();
final border = OutlineInputBorder(
  borderSide: BorderSide(color: const Color.fromRGBO(211, 195, 192, 1)),
  borderRadius: BorderRadius.circular(16),
);

class _HomePageState extends State<HomePage> {
  int quantity = 0;
  int orders = 0;
  void addOne() {
    quantity += 1;
  }

  void subOne() {
    quantity -= 1;
  }

  void addOrder() {
    orders += 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Center(
            child: const Text(
              'Order Coffee',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        body: ListView(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.vertical(
                    bottom: Radius.circular(48),
                  ),
                  child: Stack(
                    children: [
                      Image.network(
                        'https://images.unsplash.com/photo-1541167760496-1628856ab772?q=80&w=800&auto=format&fit=crop',
                      ),
                      Positioned(
                        top: 20,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(50, 44, 41, 0.9),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.workspace_premium,
                                color: Color.fromRGBO(156, 147, 143, 1),
                              ),
                              Text(
                                'Premium',
                                style: TextStyle(
                                  color: Color.fromRGBO(156, 147, 143, 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Caramel Macchiato',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight(700),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: '\$',
                              style: TextStyle(
                                color: Color.fromRGBO(27, 109, 36, 1),
                                fontSize: 24,
                                fontWeight: FontWeight(900),
                              ),
                              children: [
                                TextSpan(
                                  text: '4.99',
                                  style: TextStyle(
                                    color: Color.fromRGBO(27, 109, 36, 1),
                                    fontSize: 36,
                                    fontWeight: FontWeight(700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Espresso layered with smooth steamed milk and sweet vanilla syrup,finished with a rich caramel drizzle.',
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          _descriptionContainer('Hot'),
                          SizedBox(width: 10),
                          _descriptionContainer('12 oz'),
                          SizedBox(width: 10),
                          _descriptionContainer('whole Milk'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Customization Notes',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight(700),
                        ),
                      ),
                      Form(
                        key: formKey,
                        child: TextFormField(
                          enabled: quantity!=0,
                          controller: controller,
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'E.g., Extra hot, oat milk...',
                            hintStyle: TextStyle(
                              color: const Color.fromRGBO(80, 68, 66, 0.5),
                            ),
                            border: border,
                            enabledBorder: border,
                            focusedBorder: border,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'this field is required';
                            }
                            if (value.length < 3) {
                              return 'please enter valid input';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          border: BoxBorder.all(
                            color: const Color.fromRGBO(211, 195, 192, 1),
                          ),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Quantity',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight(700),
                                ),
                              ),
                              Container(
                                height: 40,
                                width: 112,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(239, 237, 236, 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      onPressed: quantity == 0
                                          ? null
                                          : () {
                                              setState(() {
                                                subOne();
                                              });
                                            },
                                      icon: Icon(
                                        Icons.remove,
                                        fontWeight: FontWeight(700),
                                        color: quantity == 0
                                            ? Color.fromARGB(255, 228, 228, 228)
                                            : null,
                                      ),
                                    ),
                                    Text(
                                      '$quantity',
                                      style: TextStyle(
                                        fontWeight: FontWeight(700),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: quantity == 9
                                          ? null
                                          : () {
                                              setState(() {
                                                addOne();
                                              });
                                            },
                                      icon: Icon(
                                        Icons.add,
                                        fontWeight: FontWeight(700),
                                        color: quantity == 9
                                            ? Color.fromRGBO(228, 228, 228, 1)
                                            : null,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: quantity == 0
                            ? null
                            : () {
                                setState(() {
                                  if (formKey.currentState!.validate()) {
                                    addOrder();
                                  }
                                });
                              },
                        label: const Text(
                          'Place Order',
                          style: TextStyle(
                            color: Color.fromRGBO(228, 228, 228, 1),
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward,
                          color: Color.fromRGBO(228, 228, 228, 1),
                        ),
                        iconAlignment: IconAlignment.end,
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(50),
                          ),
                          minimumSize: Size(double.infinity, 50),
                          backgroundColor: const Color.fromRGBO(62, 39, 35, 1),
                          disabledBackgroundColor: const Color.fromRGBO(1, 1, 1, 0.5254901960784314)
                        ),
                      ),
                      Align(
                        alignment: AlignmentGeometry.bottomRight,

                        child: Stack(
                          alignment: AlignmentGeometry.topEnd,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: FloatingActionButton(
                                onPressed: () {},
                                backgroundColor: Color.fromRGBO(
                                  160,
                                  243,
                                  153,
                                  1,
                                ),
                                elevation: 0,
                                child: Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color.fromRGBO(33, 113, 40, 1),
                                ),
                              ),
                            ),
                            if (orders != 0)
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(186, 26, 26, 1),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '$orders',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: orders == 0
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ], //main children
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(239, 237, 236, 1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(48)),
          ),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.home)),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(160, 243, 153, 1),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.document_scanner_outlined),
                ),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              IconButton(onPressed: () {}, icon: Icon(Icons.person_2_outlined)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _descriptionContainer(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(239, 237, 236, 1),
      borderRadius: BorderRadiusGeometry.circular(16),
    ),
    child: Text(text),
  );
}
