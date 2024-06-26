import SwiftUI

struct SideBarsView: View {
    @State private var showLeft = false
    @State private var showRight = false

    var body: some View {
        HStack {
            //Left
            VStack {
                Text("Left")
            }
            .frame(maxHeight: .infinity)
            .frame(width: showLeft ? 150: 0)
            .background(.red)

            //Main
            VStack {
                HStack {
                    Button {
                        withAnimation {
                            showLeft.toggle()
                        }
                    } label: {
                        Image(systemName: "rectangle.split.3x1")
                    }
                    .padding()

                    Spacer()

                    Button {
                        withAnimation {
                            showRight.toggle()
                        }
                    } label: {
                        Image(systemName: "rectangle.split.3x1")
                    }
                    .padding()
                }

                Spacer()

                Text("Main")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green)

            //Right
            VStack {
                Text("Right")
            }
            .frame(maxHeight: .infinity)
            .frame(width: showRight ? 150: 0)
            .background(.purple)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct SideBarsView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarsView()
    }
}
