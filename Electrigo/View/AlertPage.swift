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
    @State private var selectedProblemType: ChargingStationProblemType = .stationNotWorking
    @State private var comment: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                

                VStack(alignment: .leading, spacing: 20) {
                    // Problem type selection
                    Text("Select the type of problem you are experiencing:")
                        .font(.title2)
                        .fontWeight(.medium)
                        .padding()

                    VStack(alignment: .leading, spacing: 10) {
                        ForEach(ChargingStationProblemType.allCases, id: \.self) { problemType in
                            ProblemTypeItem(problemType: problemType, selectedProblemType: $selectedProblemType)
                        }
                        .padding()
                    }

                    NavigationLink(destination: CommentPage(comment: $comment)) {
                        Text("Next")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 50)
                            .background(Color.red.opacity(0.75 ))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
            }
            .navigationTitle("Report Charging Station Problem")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}




struct ProblemTypeItem: View {
    let problemType: ChargingStationProblemType
    @Binding var selectedProblemType: ChargingStationProblemType

    var body: some View {
        Button(action: {
            selectedProblemType = problemType
        }) {
            HStack {
                if problemType == selectedProblemType {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.gray)
                }

                Text(problemType.description)
                    .font(.body)
                    .padding()
            }
        }
        .padding()
    }
}

struct ProblemTypeItemWithComment: View {
    let problemType: ChargingStationProblemType
    @Binding var selectedProblemType: ChargingStationProblemType
    @Binding var showCommentPage: Bool
    @Binding var comment: String

    var body: some View {
        Button(action: {
            selectedProblemType = problemType
            showCommentPage = true // Update the `showCommentPage` property
        }) {
            HStack {
                if problemType == selectedProblemType {
                    Image(systemName: "circle.fill")
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: "circle")
                        .foregroundColor(.gray)
                }

                Text(problemType.description)
                    .font(.body)
                    .padding()
            }
        }
        .padding()
    }
}

struct CommentPage: View {
    @Binding var comment: String

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Share Additional Details")) {
                    TextField("Enter your comment", text: $comment)
                        .padding()
                }

                NavigationLink(destination: ArrivedView() ){
                    Text("Submit Comment")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.red.opacity(0.75 ))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
                .foregroundColor(.blue)
                .padding()
            }
            .navigationTitle("Share Additional Details")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
        }
    }
}



struct ArrivedView: View {
    @State private var isAnimated = false

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 100)
                    .frame(width: 100, height: 100)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5))
                    .onAppear {
                        isAnimated = true
                    }

                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                    .scaleEffect(isAnimated ? 1 : 0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.5))
                    .onAppear {
                        isAnimated = true
                    }
            }
            .padding(50)

            Text("We Have Arrived!")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)

            Text("We have arrived at GYM location")
                .foregroundColor(.gray)

            Spacer()
                .frame(height: 100)

            Button("OK") {
                // TODO: Implement logic here
            }
            .frame(width: 350, height: 50)
            .background(Color.blue)
            .cornerRadius(15)
            .foregroundColor(.white)
        }
    }
}

struct AlertPage_Previews: PreviewProvider {
    static var previews: some View {
        AlertPage()
    }
}
