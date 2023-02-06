//
//  Tab.swift
//  Briefull
//
//  Created by Amaal Almutairi on 11/07/1444 AH.
//

import SwiftUI

struct Tab: View {
    
    @State var selection = 2
    
    var body: some View {
        VStack{
           // NavigationView{
                VStack{
                    TabView(selection: $selection) {
                        Profile().tabItem {  Text("Profile") }.tag(1)
                        Vlog().tabItem { Text("Vlog") }.tag(2)
                        Main().tabItem { Text("TimeLine") }.tag(3)
                    }
                    
                }
          //  }
        }
    }
}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
