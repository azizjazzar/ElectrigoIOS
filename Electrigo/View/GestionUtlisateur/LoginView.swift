import SwiftUI;
import CoreLocation;
import LocalAuthentication

struct LoginView: View {
    @StateObject var loginController = UserViewModel()
   
    @State private var email = ""
    @State private var nom = ""

    @State private var isChecked = false
    

    var location: CLLocation?
    
    var body: some View {
        
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
                
                SecureField(" Mot de passe", text: $nom)
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
                
                
                
                
                NavigationLink{
                    // BarDeNavigationView()
                    BarDeNavigationView(selectedTab: 0).presentationDetents([.large])
                        .navigationBarBackButtonHidden(true)
                    
                }
                
                label :{ Text("Se connecter")}
                
                    .navigationBarBackButtonHidden(true)
                    .padding(.vertical, 10)
                    .frame(width: 350, height: 50)
                    .background(Color.blue)
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .sheet(isPresented: $isChecked) {
                        UserSetings() // Utilisez NavigationLink pour présenter la page VehiculeForumView
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
    func Homepage()
    {
        //NavigationLink(destination:RegisterView(),label:"test")
        
    }
    
}
 
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
    
    

