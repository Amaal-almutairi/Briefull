//
//  Profile.swift
//  Briefull
//
//  Created by Amaal Almutairi on 11/07/1444 AH.
//

import SwiftUI

struct Profile: View {
    
    @State var userName = ""
    @State var nickName = ""
    @EnvironmentObject var sessionVm: SessionStore

    
    
    var body: some View {
        
        VStack{
//            NavigationView{
                ScrollView{
                    VStack(alignment: .center){
                        
                        ZStack(alignment: .bottomTrailing) {
                            Image("profileImage")
                                .profileImageMod()
                            
                        }
                        Text(" nickName \(nickName)").font(.headline)
                        Text(sessionVm.session?.username ?? "UkUsername")
                        
                        HStack{
                            VStack{
                                Text(" Vlogs \(nickName)").padding(.leading, 50)
                                Text(" 6 \(nickName)").font(.headline).padding(.leading, 50)
                            }
                            Spacer().padding()
                            VStack{
                                Text(" Friends \(nickName)").padding(.trailing, 50)
                                Text(" 10 \(nickName)").font(.headline).padding(.trailing, 50)
                            }
                        } .padding()
                        Divider().fontWidth(.standard)
                        Spacer()
                        
                    }.navigationTitle("Profile")
                        .navigationBarItems(trailing: NavigationLink(destination: EditPersonalInfo(), label: {
                            Text("Edit").foregroundColor(Color("mauve"))
                        }))
                }
//            }
            .navigationViewStyle(.stack)
        }
    }
    
}

struct Profile_Previews: PreviewProvider {
    var sessionVm: SessionStore
    static var previews: some View {
        Profile().environmentObject(SessionStore())
    }
}
