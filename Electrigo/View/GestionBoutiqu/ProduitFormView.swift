import SwiftUI
import PhotosUI

/*struct ImagePicker: View {
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
}*/
/*
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
*/
struct ProduitFormView: View {
    @ObservedObject var produitViewModel = ProduitViewModel()
      @State private var nom: String = ""
      @State private var description: String = ""
      @State private var prix: Float = 0.0
      @State private var rating: Int = 0
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    

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

                    TextField("Nom du Produit", text: $nom)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text("Desciption du produit")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("Desciption du produit", text: $description)
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
                }
                
                
                // image de produit
                
                VStack(alignment: .leading, spacing: 10) {
                    if let selectedImageData,
                       let uiImage = UIImage(data: selectedImageData) {
        
                        
                /*        // Sauvegarder l'image dans le dossier Documents
                        if  let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
                            let fileURL = documentsDirectory.appendingPathComponent("dynamicImage.png")
                            do {
                                try uiImage.pngData()?.write(to: fileURL)
                                print("Image sauvegardée avec succès à \(fileURL.absoluteString)")
                            } catch {
                                print("Erreur lors de la sauvegarde de l'image: \(error)")
                            }
                        }*/
                       

                        
                        // Afficher l'image sauvegardée
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250, height: 250)
                    }
                

                }
                
             
                
                
                // fin de l'image de produit
                
                
                
                

                VStack(alignment: .leading, spacing: 10) {
                    Text("Prix")
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .italic()
                        .foregroundColor(Color(red: 0.27, green: 0.27, blue: 0.27))

                    TextField("prix du produit", text: Binding<String>(
                        get: { String(prix) },
                        set: {
                            if let value = Float($0) {
                                prix = value
                            }
                        }
                    ))
                        .font(.custom("Poppins", size: 14))
                        .fontWeight(.bold)
                        .tracking(1.61)
                        .foregroundColor(Color(red: 0.68, green: 0.68, blue: 0.68))
                        .padding()
                        .background(Color(red: 0.93, green: 0.93, blue: 0.94))
                        .cornerRadius(10)
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
                        let nouveauProduit = Produit(nom: nom, description: description, prix: prix, rating: rating)
                        produitViewModel.ajouterProduit(nouveauProduit)

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
func saveImage(image: UIImage, toFile filename: String) {
    let data = image.pngData()

    if let data = data {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = url.appendingPathComponent(filename)

        do {
            try data.write(to: fileURL)
        } catch {
            print("Erreur lors de l'enregistrement de l'image : \(error)")
        }
    }
}
struct PorduitFormView_Previews: PreviewProvider {
    static var previews: some View {
        ProduitFormView()
    }
}



