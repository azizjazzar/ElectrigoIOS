import SwiftUI;
import CoreLocation;

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isChecked = false
    var location: CLLocation?

    var body: some View {
      
        NavigationView{

        VStack {
            Text("Connectez-vous")
                .font(.largeTitle)
                .bold()
                .padding(.vertical,40)

            TextField("Email", text: $email)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1))
                .padding(.vertical, 10)

            SecureField("Mot de passe", text: $password)
                .frame(width: 350, height: 50)
                .background(Color.clear)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1))
                .foregroundColor(.black)
                .labelStyle(.titleOnly)
                .font(.system(size: 12, weight: .light))

            // Checkbox
            HStack(spacing: 10) {
                Button(action: { self.isChecked.toggle() }) {
                    Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.black)
                    Text("Se souvenir de moi ? /")
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

        
         
            Button(action: { /* TODO: Implement login logic here */ }) {
                Text("Se Connecter")
            }
            .padding(.vertical, 10)
            .frame(width: 350, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .foregroundColor(.white)

        



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
                NavigationLink(destination: RegisterView()) {
                                   Text("Créer un compte")
                                       .underline()
                                       .foregroundColor(.black)
                               }


            }
           
        }
        }
        
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
    
}
