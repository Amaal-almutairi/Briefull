//
//  ExtensionFile.swift
//  Briefull
//
//  Created by Amaal Almutairi on 15/07/1444 AH.
//


import SwiftUI

extension Image {
    
    func profileImageMod() -> some View {
        self
            .resizable()
            .frame(width: 120, height: 120)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
    
}

extension Rectangle {
    
    func rectangle() -> some View {
        self
            .frame(width:UIScreen.main.bounds.width - 30, height: 500).cornerRadius(20)
            .foregroundColor(.gray.opacity(0.40))
    }
    
}
extension Rectangle {
    
    func rectangleImoji() -> some View {
        self
            .frame(width:UIScreen.main.bounds.width - 30, height: 120).cornerRadius(20)
            .foregroundColor(.gray.opacity(0.40))
    }
    
}
