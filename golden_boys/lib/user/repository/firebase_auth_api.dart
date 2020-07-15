import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBaseAuthAPI {
//esto es la logica de negocio para hacer una conexion con cualquier api
  final FirebaseAuth _auth = FirebaseAuth.instance; //esta variable contiene la instacia de firebase(nos trae toda la composicion de firebase)
  final GoogleSignIn googleSignIn = GoogleSignIn(); // esta es una variable que nos trae todoo lo que tiene que ver con google

  Future<FirebaseUser> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn(); //estamos solicitando con que cuenta te quieres registrar
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication; //aqui obtenemos las credenciales de las cuentas y se guardan en gSA

    /*AQUI GOOGLE le pasa las credenciales de la cuenta obtenida se las pasa al objeto user de firebase*/
    FirebaseUser user = await _auth.signInWithCredential(
        GoogleAuthProvider.getCredential(
            idToken: gSA.idToken, accessToken: gSA.accessToken)
    );

    return user;
  }

  //este es el metodo para cerrar sesión
  //el then nos ayuda a ver en el log si ocurrio lo indicado
  signOut() async{
    await _auth.signOut().then((onValue) => print("Sesión cerrada"));
    googleSignIn.signOut();
    print("Sesiones cerradas");
  }

}