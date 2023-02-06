//
//  Profile.swift
//  Briefull
//
//  Created by Amaal Almutairi on 11/07/1444 AH.
//

import SwiftUI

struct Profile: View {
    @State var changeProfileImage = false
    @State var openCameraRoll = false
    @State var imageSelected = UIImage()
    @State var userName = ""
    @State var nickName = ""
    var body: some View {
     
            VStack(alignment: .center){
                ZStack(alignment: .bottomTrailing) {
                    Button(action: {
                        changeProfileImage = true
                        openCameraRoll = true
                        
                    }, label: {
                        if changeProfileImage {
                            Image(uiImage: imageSelected)
                                .profileImageMod()
                        } else {
                            Image("profileImage")
                                .profileImageMod()
                        }
                        
                    })
                    
                    Image(systemName: "highlighter")
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .background(Color("mauve"))
                        .clipShape(Circle())
                    
                }.sheet(isPresented: $openCameraRoll) {
                    ImagePicker(selectedImage: $imageSelected, sourceType: .photoLibrary)
                }
                Text(" nickName \(nickName)").font(.headline)
                Text(" userName \(userName)")
                   
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

            }.navigationTitle("Prpfile")
           
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
