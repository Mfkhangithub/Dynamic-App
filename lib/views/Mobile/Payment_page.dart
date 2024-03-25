import 'package:flutter/material.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:saloonstore/components/Colors.dart';
import 'package:saloonstore/components/Payment_Quantity_wisget.dart';
import 'package:saloonstore/components/Text_Field.dart';
import 'package:saloonstore/data/Responces/Status.dart';
import 'package:saloonstore/model/Agent_model.dart';
import 'package:saloonstore/model/Items_model.dart';
import 'package:saloonstore/provider/All_Deparments.dart';
import 'package:saloonstore/provider/Payment_provider.dart';
import 'package:saloonstore/provider/Validation_provider.dart';
import 'package:saloonstore/services/Home_View_model.dart';
import 'package:saloonstore/utils/Constants.dart';
import 'package:saloonstore/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class Payment_page extends StatefulWidget {
  final Items_data item;
  const Payment_page({super.key, required this.item});

  @override
  State<Payment_page> createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {
  HomeViewModel homeviewmodel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    homeviewmodel.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final validateprovider =
        Provider.of<ValidationProvider>(context, listen: false);
    final provider = Provider.of<ProviderController>(context, listen: false);
    final paymentprovider =
        Provider.of<PaymentProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Order form"),
      ),
      body: ChangeNotifierProvider<HomeViewModel>(
        create: (BuildContext context) => homeviewmodel,
        child: Consumer<HomeViewModel>(
          builder: (context, value, child) {
            if (value.storelist.status == Status.LOADING) {
              return const Center(
                child: SpinKitThreeBounce(
                  color: AppColors
                      .primaryColor, // You can set the color to match your theme
                  size: 50.0, // Adjust the size as needed
                ),
              );
            } else if (value.storelist.status == Status.ERROR) {
              return const Center(
                child: Text("error loading data"),
              );
            } else if (value.storelist.status == Status.COMPLETED) {
              final store = value.storelist.data!;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Details",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const Gutter(),
                            Consumer<ValidationProvider>(
                              builder: (context, val, child) {
                                return Text_Field(
                                  controller: validateprovider.namecontorller,
                                  onchange: (value) {
                                    validateprovider.validateName(value);
                                  },
                                  labeltext: "Name",
                                  hinttext: "Like Mahran Khan",
                                  errorttext: val.name.error,
                                );
                              },
                            ),
                            const Gutter(),
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  controller: validateprovider.adresscontorller,
                                  onchange: (val) {
                                    validateprovider.validateAddress(val);
                                  },
                                  labeltext: "Delivery Address",
                                  hinttext:
                                      "House#, Street#, Sector, and City Name",
                                  errorttext: value.address.error,
                                );
                              },
                            ),
                            const Gutter(),
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  controller:
                                      validateprovider.whatappcontroller,
                                  onchange: (val) {
                                    validateprovider.validateWhatsapp(val);
                                  },
                                  labeltext: "Whatsapp with country code",
                                  hinttext: "Like +921234567...",
                                  errorttext: value.whatsapp.error,
                                );
                              },
                            ),
                            const Gutter(),
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  controller: validateprovider.emailcontroller,
                                  onchange: (val) {
                                    validateprovider.validateEmail(val);
                                  },
                                  labeltext: "Email",
                                  hinttext: "Like Mahran@gmail.com",
                                  errorttext: value.email.error,
                                );
                              },
                            ),
                            const Gutter(),
                            // DEFULT TEXT
                            Consumer<ValidationProvider>(
                              builder: (context, value, child) {
                                return Text_Field(
                                  hinttext: "Enter message if any",
                                  labeltext: "Enter message if any",
                                  controller:
                                      validateprovider.fromtextcontroller,
                                  onchange: (val) {
                                    validateprovider.validateMessage(val);
                                  },
                                  maxline: 3,
                                );
                              },
                            ),
                            const Gutter(),
                            const Gutter(),
                            //DROP DOWN MENU SECTION
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors
                                        .blueAccent), // Outline border color
                                borderRadius: BorderRadius.circular(
                                    8), // Optional: Add border radius
                              ),
                              child: Consumer<ProviderController>(
                                builder: (context, value, child) {
                                  return DropdownButton(
                                    value: value.selectedpayment,
                                    items: value.options.map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(option),
                                      );
                                    }).toList(),
                                    onChanged: (val) {
                                      value.setSelectedpayment(val!);
                                    },
                                  );
                                },
                              ),
                            ),

                            const Gutter(),
                            // QUANTITY WIDGET SECTION
                            Paymentwidget(
                              currency: widget.item.itemCurrency ?? "",
                              itemPrice: widget.item.itemPrice ?? "",
                            ),

                            //SHOW TOTAL PRICE
                            const Row(
                              children: [
                                // Consumer<>(
                                //   builder: (context, value, child) {
                                //     int quantity = value.quantity;
                                //     double itemPrice = double.tryParse(
                                //             widget.item.itemPrice ?? "0.0") ??
                                //         0.0;

                                //     // Calculate the total amount based on the quantity
                                //     double totalAmount = itemPrice * quantity;

                                //     return Text(
                                //  "\$${totalAmount.toStringAsFixed(2)}",
                                //     );
                                //   },
                                // ),
                              ],
                            ),

                            //CHECKBOX SECTION
                            const Gutter(),
                            Consumer<ProviderController>(
                              builder: (context, value, child) {
                                return Row(
                                  children: [
                                    Radio<bool>(
                                      value: true,
                                      groupValue: value
                                          .firstValue, // Add this line to handle the selected value
                                      onChanged: (val) {
                                        value.setfirstValue(
                                            val!); // Add this line to set the selected value
                                      },
                                    ),
                                    const Text("Lease"),
                                  ],
                                );
                              },
                            ),
                            Consumer<ProviderController>(
                              builder: (context, value, child) {
                                return Row(
                                  children: [
                                    Radio<bool>(
                                      value: false,
                                      groupValue: value
                                          .firstValue, // Add this line to handle the selected value
                                      onChanged: (val) {
                                        value.setfirstValue(
                                            val!); // Add this line to set the selected value
                                      },
                                    ),
                                    const Text("Cash")
                                  ],
                                );
                              },
                            ),

                            const Gutter(),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      0), // Set the border radius to 0 for a square shape
                                ),
                                backgroundColor:
                                    provider.getColorFromName(store.s66 ?? ""),
                                foregroundColor: AppColors.white,
                              ),
                              label: const Text(
                                "Email Now",
                              ),
                              icon: const Icon(
                                FontAwesomeIcons.envelope,
                              ),
                              onPressed: () {
                                if (!validateprovider.isFormValid) {
                                  utils.Show_Flushbar_Error_Message(
                                      "Please enter your field", context);
                                } else {
                                  String name =
                                      validateprovider.namecontorller.text;
                                  String address =
                                      validateprovider.adresscontorller.text;
                                  String whatsapp =
                                      validateprovider.whatappcontroller.text;
                                  String email =
                                      validateprovider.emailcontroller.text;
                                  String fromtext =
                                      validateprovider.fromtextcontroller.text;
                                  int quantity = paymentprovider.quantity;
                                  String selectedPayment =
                                      provider.selectedpayment ?? "";
                                  String emailto = store.s67 ?? "";
                                  bool isCashPayment = provider
                                      .firstValue; // Get the selected payment method
                                  String purchasecontract =
                                      isCashPayment ? "lease" : "Cash";
                                  String defaultEmailSubject =
                                      "Order on ${store.s9} ";
                                  String commonttext = "Item Name: ${widget.item.itemName}\nCustomer Name: $name\nAddress: $address\nWhatsApp: $whatsapp\nEmail: $email \nDiscription: $fromtext \n \nPayment:$selectedPayment\nQuantity:$quantity\nPurchase Mode: $purchasecontract \nProduct Link: $servalUrl\en/product/${widget.item.itemId}";
                                  String result = whatsapp.substring(1);
                                  String defaultEmailBody =
                                      " $commonttext \n \nConfirm order on Whatsapp (by ScreenShort) :https://wa.me/$result ";

                                  String emailLaunchUri =
                                      'mailto:$emailto ?subject=$defaultEmailSubject&body=$defaultEmailBody';

                                  launch(emailLaunchUri);
                                }
                              },
                            ),
                            const Gutter(),
                           
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      0), // Set the border radius to 0 for a square shape
                                ),
                                backgroundColor: AppColors.accentColor,
                                foregroundColor: AppColors.white,
                              ),
                              label: const Text(
                                "WhatsApp Now",
                              ),
                              icon: const Icon(
                                FontAwesomeIcons.whatsapp,
                              ),
                              onPressed: () async {
                                if (!validateprovider.isFormValid) {
                                  utils.Show_Flushbar_Error_Message(
                                      "Please enter your field", context);
                                } else {
                                  String name =
                                      validateprovider.namecontorller.text;
                                  String address =
                                      validateprovider.adresscontorller.text;
                                  String fromtext =
                                      validateprovider.fromtextcontroller.text;
                                  String whatsapp =
                                      validateprovider.whatappcontroller.text;
                                  String email =
                                      validateprovider.emailcontroller.text;
                                  bool isCashPayment = provider
                                      .firstValue; // Get the selected payment method
                                  String purchasecontract =
                                      isCashPayment ? "lease" : "Cash";

                                  String defaultWhatsAppMessage =
                                      "How to Buy.\n"
                                      "Name :  ${widget.item.itemName ?? ""}\nprice: ${widget.item.itemPrice}\nName: $name\nAddress: $address\nWhatsApp: $whatsapp\nEmail: $email\nPurchase Mode: $purchasecontract \nDiscription: $fromtext \n \nProduct Link: $servalUrl"
                                      'en/product/'
                                      "${widget.item.itemId}";

                                  await provider.whatapplunch(
                                      phoneNumber: store.s68 ?? '',
                                      message: defaultWhatsAppMessage);
                                }
                              },
                            ),
                            const Gutter(),
                          ],
                        ),
                      ),
                      const Gutter(),

                      // AGENT WORK SECTION
                      SizedBox(
                        height: 350,
                        width: double.infinity,
                        child: ChangeNotifierProvider<HomeViewModel>(
                          create: (BuildContext context) => homeviewmodel,
                          child: Consumer<HomeViewModel>(
                            builder: (context, value, child) {
                              final List<Agents_data> agentList =
                                  value.agentList.data ?? [];
                              final List<int> shuffledIndices = List.generate(
                                  agentList.length, (index) => index)
                                ..shuffle();

                              return PageView.builder(
                                itemCount: shuffledIndices.isNotEmpty ? 1 : 0,
                                itemBuilder:
                                    (BuildContext context, int pageIndex) {
                                  if (shuffledIndices.isNotEmpty) {
                                    final int index =
                                        shuffledIndices[pageIndex];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 150,
                                              width: 150,
                                              child: Image.network(imagespath +
                                                  (agentList[index]
                                                          .agentPhoto1 ??
                                                      "")),
                                            ),
                                            const Gutter(),
                                            Text(
                                              "Contact Our Agent# ${agentList[index].agentName ?? ""}",
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: AppColors.purple),
                                            ),
                                            const Center(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 65, right: 40),
                                                child: Text(
                                                  "Contact me for any kind of gaming details you want!",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            const Gutter(),
                                            ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                ),
                                                backgroundColor:
                                                    AppColors.accentColor,
                                                foregroundColor:
                                                    AppColors.white,
                                              ),
                                              label: const Text("WhatsApp"),
                                              icon: const Icon(
                                                  FontAwesomeIcons.whatsapp),
                                              onPressed: () async {
                                                await provider
                                                    .launchwhatsappURLwithphone(
                                                        agentList[index]
                                                                .agentContact ??
                                                            '');
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child:
                                            Text("Sorry! No agents available"));
                                  }
                                },
                              );
                            },
                          ),
                        ),
                      ),

                      const Gutter(),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: SpinKitDoubleBounce(
                color: AppColors
                    .accentColor, // You can set the color to match your theme
                size: 50.0, // Adjust the size as needed
              ),
            );
          },
        ),
      ),
    );
  }
}
