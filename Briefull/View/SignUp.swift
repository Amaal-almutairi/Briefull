//
//  SignUp.swift
//  Briefull
//
//  Created by Amaal Almutairi on 11/07/1444 AH.
//

import SwiftUI

struct SignUp: View {
    
    @State var email = ""
    @State var passWord = ""
    @State var ConfermPassWord = ""
    @State var userName = ""
    @State private var borderColor = Color.clear
    @StateObject private var vm = SignUpViewModel()
    @EnvironmentObject var coordinator: Coordinator
    @State var showLogInSheet = false
    var body: some View {
        VStack{
            
            ScrollView {
                ZStack(alignment: .center){
                    Color(.yellow).opacity(0.40)
                    
                    VStack(alignment: .leading){
                        Text("Sign Up").padding(.vertical).padding(.top,200).modifier(Items.TexStyleModifier()).padding(.bottom,100)
                        TextField("Enter userName", text: $userName).padding().modifier(Items.TextFieldStyleModifier())
                        TextField("Enter Your Email Address", text: $email).padding().modifier(Items.TextFieldStyleModifier()).keyboardType(.emailAddress)
                        SecureField("Enter Your PassWord", text: $passWord).padding().modifier(Items.TextFieldStyleModifier())
                        SecureField("Re - Enter Your PassWord", text: $ConfermPassWord).padding().modifier(Items.TextFieldStyleModifier())
                        Button("Sign Up") {
                            vm.signUp(email: email, password: passWord) { result in
                                switch result {
                                case .success(_):
                                    coordinator.path.append(.login)
                                case .failure(let error):
                                    vm.errorMessage = error.errorMessage
                                }
                            }
                            
                            
                        }.modifier(Items.ButtonModifier()).padding().foregroundColor(.white)
                        if let errorMessage = vm.errorMessage {
                            Text(errorMessage)
                        }
                        HStack{
                            Spacer()
                            NavigationLink(destination: SignIn()) {
                              Text("Have an Account?")
                            }
//                            Button("Have an Account?", action: {
                               
                               // showLogInSheet.toggle()
//                          SignIn()
                                
//                            })
                          


                        }.padding()

                    }.padding(.bottom,400).padding(.trailing)
                }
                
            }
        }.padding(.leading)
        
        
//        .sheet(isPresented: $showLogInSheet){
//            SignIn()
//                .presentationDetents([.height(470)])
//                .presentationDragIndicator(.visible)
//        }
    }
    
//    func autheticateUser(email: String, password: String){
//
//        if email == email && password.lowercased() == passWord{
//
//
//        }else{
//            borderColor = Color.red
//        }
//    }
    
    
}



// Create Sign up page

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SignUp()
        }.navigationDestination(for: Route.self) { route in
            switch route {
            case .login:
                Text("LOGIN SCREEN")
                
            }
        }
    }
}
