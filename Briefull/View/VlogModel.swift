//
//  VlogModel.swift
//  Briefull
//
//  Created by Amaal Almutairi on 17/07/1444 AH.
//

import Foundation


struct VideoModel:Encodable, Decodable {
    var caption: String
    var likes: [String: Bool]
    var geoLocation: String
    var ownerld: String
    var postId: String
    var username: String
    var profile: String
    var mediaUrl: String
    var date: Double
    var likeCount: Int
}
