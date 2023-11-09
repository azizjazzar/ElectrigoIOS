import SwiftUI

struct ImagePicker: View {
    @Binding var image: Image?
    @State private var isImagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?

    var body: some View {
        
        VStack {
            
            image?
                .resizable()
                .scaledToFit()
                .frame(height: 100)

            Button(action: {
                isImagePickerPresented.toggle()
            }) {
                Text("Ajouter une Image")
                    .font(.custom("Poppins", size: 14))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 0.05, green: 0.60, blue: 1))
            }
            .sheet(isPresented: $isImagePickerPresented) {
                ImagePickerView(selectedImage: $selectedImage)
            }
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePickerView

        init(parent: ImagePickerView) {
            self.parent = parent
        }

        func imagePickerController(
            _ picker: UIImagePickerController,
            didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
        ) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.selectedImage = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    @Environment(\.presentationMode) var presentationMode

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ProduitFormView: View {
    @State private var productName = ""
    @State private var productAddress = ""
    @State private var productCategory = ""
    @State private var productImage: Image?
    @State private var selectedType = ""

    var body: some View {
        NavigationView
        {
     
        VStack(alignment: .leading, spacing: 20) {
            
            NavigationLink(destination:BoutiqueView()) {
                HStack {
                    Image(systemName: "chevron.left") // Utilise une image SF Symbols pour le bouton de retour
                           .foregroundColor(.black)
                           .padding(.leading, 8) // Ajuste la marge à gauche si nécessaire
                       Text("Retour")
                                          
                                         }
            }
                
            Text("Formulaire de Produit")
                .font(.custom("Poppins", size: 24))
                .fontWeight(.bold)
                .foregroundColor(.black)

            Group {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Nom")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Nom du Produit", text: $productName)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Adresse du Produit")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Adresse du Produit", text: $productAddress)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Catégorie")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .italic()
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Catégorie du Produit", text: $productCategory)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                ImagePicker(image: $productImage)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 10) {
                    Text("Type")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .italic()
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    Picker("Type", selection: $selectedType) {
                        Text("Payant").tag("Payant")
                        Text("Gratuit").tag("Gratuit")
                        Text("Autre").tag("Autre")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .padding(.horizontal, 20)

            Group {
                HStack(spacing: 20) {
                    Button(action: {
                        // Logique d'annulation
                    }) {
                        Text("Annuler")
                            .font(.custom("Jost", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))
                            .padding()
                            .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                            .cornerRadius(12)
                    }
                    Button(action: {
                        // Logique de validation
                    }) {
                        Text("Valider")
                            .font(.custom("Jost", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(red: 0.05, green: 0.60, blue: 1))
                            .cornerRadius(12)
                    }
                }
     
              
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
        }
        .padding()
        .background(Color(red: 0.98, green: 0.98, blue: 0.98))
        .cornerRadius(16)
        .padding()
        }
     
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProduitFormView()
    }
}



