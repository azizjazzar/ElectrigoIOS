
import SwiftUI

struct BarDeNavigationView: View {
    
    @State public var selectedTab = 0 // Initialize selectedTab to 0
    @StateObject var vm = locationlistViewModel()
    init(selectedTab: Int) {
        self.selectedTab = selectedTab
    }
    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab) {
                VehiculeView().tabItem {
                    Image(systemName: "car.fill")
                }.tag(0)
                MapView().environmentObject(vm).tabItem {
                    Image(systemName: "location.fill")
                }.tag(1)

              

                ContentView().tabItem {
                    Image(systemName: "house")
                }.tag(2)

              //
                BoutiqueView().tabItem {
                    Image(systemName: "cart.fill")
                }.tag(3).environmentObject(CartManager())  // Ajoutez cette ligne
                FlotteView().tabItem {
                    Image(systemName: "sos.circle")
                }.tag(4)

                
            }
            .accentColor(.blue)
        }
        .navigationBarTitle(" ")   }
}


struct BarDeNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        BarDeNavigationView(selectedTab: 3)
    }
}
