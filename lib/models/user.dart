class User {
  final String nombre;
  final String apellidos;
  final String id;
  final String carrera;
  final String imageUrl;

  User({
    this.nombre = "",
    this.apellidos = "",
    this.id = "",
    this.carrera = "",
    this.imageUrl = "",
  });

  static List<User> users = [
    User(
        nombre: "Carlos",
        apellidos: "Paz Obada",
        id: "778758",
        carrera: "Administración de Sistemas",
        imageUrl:
            "https://i.pinimg.com/564x/03/61/b4/0361b4cc840d55696086999638655f19.jpg")
  ];
}
