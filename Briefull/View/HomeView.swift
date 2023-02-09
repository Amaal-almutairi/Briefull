//
//  HomeView.swift
//  Briefull
//
//  Created by Amaal Almutairi on 17/07/1444 AH.
//

import SwiftUI

struct HomeView: View {

    @EnvironmentObject var session: SessionStore
    
    
    func listen(){
        session.listen()
    }
    var body: some View {
        
        // if there is user will return Tab view  , if there is no user will return sign in
        Group{
            if (session.session != nil){
             Tab()
            }else{
                SignIn()
            }
        }.onAppear(perform: listen)
     
 

            
    }
}

struct HomeView_Previews: PreviewProvider {
    var session:SessionStore

    static var previews: some View {
        HomeView().environmentObject(SessionStore())
    }
}
