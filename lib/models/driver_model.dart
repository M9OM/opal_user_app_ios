class Driver {
  final String name;
  final String phoneNumber;
  final String avatarUrl;
  final String time;
  final String price;

  Driver(
      {required this.name,
      required this.phoneNumber,
      required this.avatarUrl,
      required this.price,
      required this.time});

  static List<Driver> drivers = [
    Driver(
        name: 'Mohammed',
        phoneNumber: '+968 90979774',
        avatarUrl:
            'https://runawayjuno.com/wp-content/uploads/2014/04/Oman-Muscat-Omani-man.jpg',
        time: 'Now', price: '3 OMR'),
    Driver(
        name: 'Said',
        phoneNumber: '+968 90979774',
        avatarUrl:
            'https://jaytindall.asia/wp-content/uploads/2020/01/Oman_13.jpg',
        time: '30m', price: '2 OMR'),
    Driver(
        name: 'Ali',
        phoneNumber: '+968 90979774',
        avatarUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhSPQmZkShZtXx4cjr7wV3XwNndzHSBQ28rA&s', time: '2h', price: '1 OMR'),
    Driver(
        name: 'Said',
        phoneNumber: '+968 90979774',
        avatarUrl:
            'https://i0.wp.com/www.myunusualjourneys.com/wp-content/uploads/2017/09/DSC_0836.jpg?resize=1024%2C683&ssl=1', time: '5h', price: '5 OMR'),
  ];
}
