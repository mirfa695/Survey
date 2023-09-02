class Values {

   final String name;
   final String email;
   final String phno;
   final String dob;
  final String blood;
  Values(
      {
        required this.name,
      required this.email,
      required this.phno,
      required this.dob,
      required this.blood});
  Values.fromMap(Map<String, dynamic> res)
      :
        name = res["name"],
        email = res["email"],
        phno = res["phno"],
        dob = res["dob"],
        blood = res["blood"];
  Map<String, Object> toMap() {
    return {

      'name': name,
      'email': email,
      'phno': phno,
      'dob': dob,
      'blood': blood
    };
  }
}
