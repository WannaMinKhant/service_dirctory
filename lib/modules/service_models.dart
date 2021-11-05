class ServiceModels {
  String name;
  String img;
  String address;
  double lat;
  double lon;
  String description;
  String phoneNo;
  String serviceName;

  ServiceModels({
    required this.name,
    required this.img,
    required this.address,
    required this.lat,
    required this.lon,
    required this.description,
    required this.phoneNo,
    required this.serviceName,s
  });
}

List<ServiceModels> serviceModels = [
  ServiceModels(
      name: "Htoo Aung Lin Auto Service",
      img: "assets/images/hal.jpg",
      address: "Yangon,Bhan TownShip",
      lat: 16.8409,
      lon: 96.1735,
      description: "I would be using Android studio during the course of this tutorial, but you can use any IDE of your choice.",
      phoneNo: "093479324",
      serviceName: "Car and MotorCycle Retial Services "),
  ServiceModels(
      name: "KMM",
      img: "assets/images/kmm.jpg",
      address: "No.343,TheinPhyu Street,Batahtaung Township",
      lat: 21.9588,
      lon: 96.0891,
      description: "the next screen, and give your project a name of your choice in the subsequent screen. In the screen that would follow, leave the default prefilled Company domain, or add one if you have, it doesn't really matter at this moment (If you are building a product that would be deployed, then it does.)",
      phoneNo: "0946782393",
      serviceName: "CCTV Installation Services"),
  ServiceModels(
      name: "TECH ACE",
      img: "assets/images/tcl.jpg",
      address: "No.443,TheinPhyu Street, Twmae TownShip",
      lat: 17.3221,
      lon: 96.4663,
      description: "the next screen, and give your project a name of your choice in the subsequent screen. In the screen that would follow, leave the default prefilled Company domain, or add one if you have, it doesn't really matter at this moment (If you are building a product that would be deployed, then it does.)",
      phoneNo: "095534271",
      serviceName: "Gaming Computer and Associres Services"),
  ServiceModels(
      name: "Ko Thanung Myint",
      img: "assets/images/ktm.png",
      address: "No.73,Lathar Street, Lamadaw township",
      lat: 19.7633,
      lon: 96.0785,
      description: "the next screen, and give your project a name of your choice in the subsequent screen. In the screen that would follow, leave the default prefilled Company domain, or add one if you have, it doesn't really matter at this moment (If you are building a product that would be deployed, then it does.)",
      phoneNo: "0963274923",
      serviceName: "Car Aircon and Spare Services"),
];
