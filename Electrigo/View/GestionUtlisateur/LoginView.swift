import SwiftUI;
import CoreLocation;
import LocalAuthentication

struct LoginView: View {
    @StateObject var loginController = UserViewModel()
    @State private var emailFound = false // Variable pour suivre si l'email est trouvé

    @State private var email = ""
    @State private var passe = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var isChecked = false
    

    var location: CLLocation?
 
    var body: some View {
        if loginController.isLoading {
            // Affichez votre vue de chargement
            ProgressView("Loading...")
        }
        else {
            
            NavigationView{
                
                VStack {
                    Text("Connectez-vous")
                        .font(.largeTitle)
                        .bold()
                    TextField(" Email", text: $email)
                        .frame(width: 350, height: 50)
                        .background(Color.clear)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                        .padding(.vertical, 10)
                    
                    SecureField(" Mot de passe", text: $passe)
                        .frame(width: 350, height: 50)
                        .background(Color.clear)
                        .cornerRadius(15)
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1))
                        .foregroundColor(.black)
                        .labelStyle(.titleOnly)
                        .font(.system(size: 15, weight: .light))
                    
                    // Checkbox
                    HStack(spacing: 10) {
                        Button(action: {
                            
                            authenticate { success in
                                if success {
                                    NavigationLink(destination: ForgetpasswordView()) {
                                        Text("Mot passe oublier")
                                            .underline()
                                            .foregroundColor(.black)
                                    }
                                    
                                } else {
                                    //Authentication Failed
                                }
                            }
                            
                            
                            
                        }) {
                            Image(systemName:"faceid")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.black)
                            Text("Utiliser Face id ? /")
                                .foregroundColor(.black)
                                .font(.system(size: 15))
                            
                            
                        }
                        NavigationLink(destination: ForgetpasswordView()) {
                            Text("Mot passe oublier")
                                .underline()
                                .foregroundColor(.black)
                        }
                    }
                    .padding(30)
                    
                    
                    
                    if emailFound {
                        
                        NavigationLink(destination: BarDeNavigationView(selectedTab: 0).presentationDetents([.large]), isActive: .constant(true)) {
                            EmptyView()
                            
                        }
                        .navigationBarBackButtonHidden(true)
                    } else {
                        Button(action: {
                            // Action pour vérifier l'email
                            fetchUser()
                            
                            
                        }) {
                            Text("Se connecter")
                                .navigationBarBackButtonHidden(true)
                                .padding(.vertical, 10)
                                .frame(width: 350, height: 50)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .foregroundColor(.white)
                        }
                        
                        .sheet(isPresented: $isChecked) {
                            UserSetings() // Utilisez NavigationLink pour présenter la page UserSetings
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    Text("Ou ")
                        .foregroundColor(.black)
                    
                    HStack {
                        Button(action: { /* TODO: Implement action here */ }) {
                            
                            Image(uiImage: UIImage(named: "Google")!)
                                .resizable()
                                .frame(width: 150, height: 50)
                        }
                        Button(action: { /* TODO: Implement action here */ }) {
                            Image(uiImage: UIImage(named: "Facebook")!)
                                .resizable()
                                .frame(width: 150, height: 50)
                        }
                    }.padding(.vertical, 40)
                    
                    
                    HStack {
                        Text("Pas encore inscris ? ")
                            .foregroundColor(.black)
                        NavigationLink(destination : RegisterView()) {
                            Text("Créer un compte")
                                .underline()
                                .foregroundColor(.black)
                        }
                        
                        
                    }
                    
                }
                .navigationBarTitle("") // Pour cacher le titre
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true) // Pour masquer la barre de navigation ent

            }
            
            
            
        }
    }
    func authenticate(completion: @escaping (Bool) -> Void) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your passwords."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                success, authenticationError in
                if success {
                    //Authentication Successful
                    completion(true)
                } else {
                    //Authentication Failed
                    completion(false)
                }
            }
        } else {
            // No Biometrics found
            completion(false)
        }
    }

    func fetchUser() {
        loginController.getEmail(email: email) { retrievedUser in
            if let user = retrievedUser {
                if user.mot_passe == passe {
                    // Le couple email/mot de passe a été trouvé
                    
                    emailFound = true
                } else {
                    // Le mot de passe ne correspond pas à l'email
                    emailFound = false
                    showAlert = true
                    alertMessage = "Mot de passe incorrect !"
                }
            } else {
                // Aucun utilisateur trouvé pour cet email
                emailFound = false
                showAlert = true
                alertMessage = "Email incorrect !"
            }
        }
        
    }


    
}
 
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
    
    

