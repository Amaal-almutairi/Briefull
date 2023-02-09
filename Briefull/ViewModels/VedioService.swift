//
//  VedioService.swift
//  Briefull
//
//  Created by Amaal Almutairi on 18/07/1444 AH.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore


class VideoService{
    
    static var Videos = AuthService.storeRoot.collection("Vlogs")
    static var AllVideos = AuthService.storeRoot.collection("allVlogs")
    static var Timeline = AuthService.storeRoot.collection("timeline")
    
    static func VideosUserId(userId: String) -> DocumentReference {
        return Videos.document(userId)
    }
    
    static func timelineUserId(userld: String) -> DocumentReference {
        return Timeline.document(userld)
    }
    
    static func uploadVideo(caption: String, imageData: Data, onSuccess: @escaping()-> Void, onError: @escaping (_
                  errorMessage: String) -> Void) {
        guard let userld = Auth.auth().currentUser?.uid else {
            return
        }
        
        let videoId = VideoService.VideosUserId(userId: userld).collection("Vlogs")
        let storageVideo = StorageService.storageVideoId(videoId: userld)
        let metadata = StorageMetadata ()
        metadata.contentType = ""
        
    }
    
}
