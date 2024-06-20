import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shinex/utils/formatters/formatter.dart';

class UserModel {
  /// keep those values final which you do not want to update[güncellemek istemediğiniz değerleri nihai tutun]
  final String id;
  String firstName;
  String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for UserModel.[UserModel için yapıcı.]
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  /// Helper function to get the full name.[Tam adı almak için yardımcı işlev.]
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number[Telefon numarasını biçimlendirmek için yardımcı işlev]
  String get formattedPhoneNo => Tformatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name into first and last name[Tam adı ad ve soyadına bölmek için statik işlev]
  static List<String> nameParts(fullName) => fullName.split(" ");

  /// static function to generate a username from the full name[Tam addan bir kullanıcı adı oluşturmak için statik işlev]
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    /// Combine first and last name[Ad ve soyadını birleştir]
    String camelCaseUsername = "$firstName$lastName";
    String usernameWithPrefix = "cwt_$camelCaseUsername"; // Add "cwt_" prefix["cwt_" önekini ekle]
    return usernameWithPrefix;
  }

  /// Static function to create an empty user model[Boş bir kullanıcı modeli oluşturmak için statik işlev]
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        email: '',
        phoneNumber: '',
        profilePicture: '',
      );

  /// Convert model to JSON structure for storing data in firebase[Firebase'de veri depolamak için modeli JSON yapısına dönüştürün]
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  /// Factory method to create a UserModel from a Firebase document snapshot[Firebase belgesinin anlık görüntüsünden UserModel oluşturmanın fabrika yöntemi]
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        userName: data['UserName'] ?? '',
        email: data['Email'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
