//
//  SignIn.swift
//  Briefull
//
//  Created by Amaal Almutairi on 11/07/1444 AH.
//

import SwiftUI

struct SignIn: View {
    @State var email = ""
    @State var passWord = ""
    @StateObject private var vm = SignUpViewModel()

    var body: some View {
        VStack{
            ScrollView {
                ZStack(alignment: .center){
                    Color(.yellow).opacity(0.40)
                    
                    VStack(alignment: .leading){
                        Text("Sign In").padding(.top,200).modifier(Items.TexStyleModifier()).padding(.bottom,100)
                        
                        TextField("  Enter Your Email Address", text: $email).modifier(Items.TextFieldStyleModifier())
                        SecureField("   Enter Your PassWord", text: $passWord).modifier(Items.TextFieldStyleModifier())
                        Button {
                            
                        } label: {
                        Text("Sign In") .foregroundColor(Color(.white))
                        }.modifier(Items.ButtonModifier()).padding()
                        if let errorMessage = vm.errorMessage {
                            Text(errorMessage)
                        }
                        HStack{
                            Button {
                                
                            } label: {
                                Text("Forget Password")
                            }
                            Spacer()
                            Button {
                                
                            } label: {
                                Text("Create New Account?")
                            }


                        }.padding()

                    }.padding().padding(.bottom,400)
                }
                
            }
        }.ignoresSafeArea()
    }
}

struct SignIn_Previews: PreviewProvider {
    var vm = SignUpViewModel()
    static var previews: some View {
        SignIn().environmentObject(SignUpViewModel())
    }
}
