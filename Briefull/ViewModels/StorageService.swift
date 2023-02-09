//
//  StorageService.swift
//  Briefull
//
//  Created by Amaal Almutairi on 16/07/1444 AH.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore

class StorageService{
    
    static var storage = Storage.storage()
    static var storageRoot = storage.reference()
    static var storageProfile = storageRoot.child("profile")
    static var storageVideo = storageRoot.child("TimeLine")
    
    
    static func storageVideoId(videoId:String) -> StorageReference {
        return storageProfile.child(videoId)
    }
    
    static func storageProfileId(userId:String) -> StorageReference {
        return storageProfile.child(userId)
    }
    
    static func saveProfileImage(userId:String, username:String, email:String, imageData: Data,
                                 metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) ->
                                 Void, onError: @escaping(_ errorMessage: String) -> Void ) {
        storageProfileImageRef.putData(imageData,metadata: metaData) {
            (StorageMetadata, error) in
            if error != nil {
                onError (error!.localizedDescription)
                return
            }
            storageProfileImageRef.downloadURL{
                (url, error) in
                if let metaImageUr1 = url?.absoluteString {
                    
                    if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                        changeRequest.photoURL = url
                        changeRequest.displayName = username
                        changeRequest.commitChanges{
                            (error) in
                            if error != nil {
                                onError(error?.localizedDescription ?? "unKnown")
                                return
                            }
                        }
                    }
                    
                    let firestoreUserId = AuthService.getUserId(userId: userId)
                    let user = User.init(uid: userId, email: email, profileImageUr1: metaImageUr1, username: username, searchName: username.splitString(), caption: "")
                    
                    guard let dict = try?user.asDictionary() else {return}
                    firestoreUserId.setData(dict) { (error) in
                        if error != nil {
                            onError(error!.localizedDescription)
                        }
                        
                    }
                    onSuccess(user)
                }
                
            }
            
        }
    }
    
    static func saveVideo(user:String, caption:String, videoId:String, imageData:Data, metaData:StorageMetadata, storageVideoRef: StorageReference, onSuccess: @escaping() -> Void ,onError: @escaping(_ errorMessage: String) -> Void){
        
        storageVideoRef.putData(imageData,metadata:metaData){
            (StorageMetadata, error) in
            if error != nil {
                onError (error!.localizedDescription)
                return
            }
            storageVideoRef.putData(imageData, metadata: metaData) {
                (StorageMetadata, error) in
                if error != nil {
                    onError (error!.localizedDescription)
                    return
                }
            }
            
        }
    }
}

/*
 static func saveProfileImage(userId:String, username:String, email:String, imageData: Data,
                               metaData:StorageMetadata, storageProfileImageRef: StorageReference, onSuccess: @escaping(_ user: User) ->
                               Void, onError: @escaping(_ errorMessage: String) -> Void ) {
     storageProfileImageRef.putData(imageData,metadata: metaData) {
         (StorageMetadata, error) in
         if error != nil {
             onError (error!.localizedDescription)
             return
         }
         storageProfileImageRef.downloadURL{
             (url, error) in
             if let metaImageUr1 = url?.absoluteString {
                 
                 if let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest(){
                     changeRequest.photoURL = url
                     changeRequest.displayName = username
                     changeRequest.commitChanges{
                         (error) in
                         if error != nil {
                             onError(error?.localizedDescription ?? "unKnown")
                             return
                         }
                     }
                 }
                 
                 let firestoreUserId = AuthService.getUserId(userId: userId)
                 let user = User.init(uid: userId, email: email, profileImageUr1: metaImageUr1, username: username, searchName: username.splitString(), caption: "")
                 
                 guard let dict = try?user.asDictionary() else {return}
                 firestoreUserId.setData(dict) { (error) in
                     if error != nil {
                         onError(error!.localizedDescription)
                     }
                     
                 }
                 onSuccess(user)
             }
             
         }
         
     }
 }
 */
