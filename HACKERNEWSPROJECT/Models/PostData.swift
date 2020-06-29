//
//  PostData.swift
//  HACKERNEWSPROJECT
//
//  Created by Dee Ker Khoo on 31/03/2020.
//  Copyright © 2020 Dee Ker MacOS. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    
    var id: String {
        return objectID
    }
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
