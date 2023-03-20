
class Users {
    Users({
        required this.cin,
        required this.email,
        required this.firstName,
        required this.lastName,
        required this.password,
        required this.phoneNumber,
        required this.speciality,
        required this.ville,
        required this.uid,
    });

    String cin;
    String email;
    String firstName;
    String lastName;
    String password;
    String phoneNumber;
    String speciality;
    String ville;
    String uid;

    static Users fromJson(Map<String, dynamic> json) => Users(
        cin: json["CIN"],
        email: json["Email"],
        firstName: json["First name"],
        lastName: json["Last name"],
        password: json["Password"],
        phoneNumber: json["Phone Number"],
        speciality: json["Speciality"],
        ville: json["Ville"],
        uid: json["uid"],
    );

    Map<String, dynamic> toJson() => {
        "CIN": cin,
        "Email": email,
        "First name": firstName,
        "Last name": lastName,
        "Password": password,
        "Phone Number": phoneNumber,
        "Speciality": speciality,
        "Ville": ville,
        "uid": uid,
    };
}
