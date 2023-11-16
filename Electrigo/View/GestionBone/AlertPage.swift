import SwiftUI

enum ChargingStationProblemType: String, CaseIterable {
    case stationNotWorking = "The station is not working"
    case accessNotPossible = "Access is not possible"
    case displayDataWrong = "Display data is wrong"
    case other = "Other"

    var description: String {
        return self.rawValue
    }
}

struct AlertPage: View {
    @State private var selectedProblemType: ChargingStationProblemType?
    @State private var comment: String = ""
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                // Problem type selection
                Text("What type of problem are you experiencing?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()

                List(ChargingStationProblemType.allCases, id: \.self) { problemType in
                    ProblemTypeItem(selectedProblemType: $selectedProblemType, problemType: problemType)
                }
                .listStyle(PlainListStyle())
                .padding(.horizontal, 30)

                NavigationLink(destination: CommentPage(selectedProblemType: selectedProblemType, comment: $comment, showAlert: $showAlert)) {
                    Text("Next")
                }
                .buttonStyle(CustomButtonStyless())
            }
            .navigationTitle("Report Charging Station Problem")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Publication ajoutée"),
                message: Text("Votre nouvelle publication a été enregistrée avec succès."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct ProblemTypeItem: View {
    @Binding var selectedProblemType: ChargingStationProblemType?
    let problemType: ChargingStationProblemType

    var body: some View {
        HStack {
            Image(systemName: selectedProblemType == problemType ? "circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.blue)

            Text(problemType.description)
                .font(.body)
                .fontWeight(.medium)
        }
        .padding(.vertical, 10)
        .onTapGesture {
            selectedProblemType = problemType
        }
    }
}

struct CommentPage: View {
    var selectedProblemType: ChargingStationProblemType?
    @Binding var comment: String
    @Binding var showAlert: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Share Additional Details")) {
                    TextField("Enter your comment", text: $comment)
                        .padding()
                }
                Button(action: {
                    showAlert = true
                }) {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.title)
                        Text("Ajouter")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding(12)
            }
            .navigationTitle("Share Additional Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
    }
}


struct CustomButtonStyless: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 45)
            .background(Color.red.opacity(0.75))
            .foregroundColor(.white)
            .cornerRadius(15)
            .shadow(radius: 4)
            .padding(.horizontal, 39)
    }
}





struct AlertPage_Previews: PreviewProvider {
    static var previews: some View {
        AlertPage()
            
    }
}
