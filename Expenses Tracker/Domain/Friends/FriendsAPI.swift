//
//  FriendsAPI.swift
//  Expenses Tracker
//
//  Created by mohammdreza on 8/3/22.
//

import Foundation

//class FriendsAPI {
//    
//    static var shared = FriendsAPI()
//    func loadItems(completion: @escaping (Result<[Friend], Error>) -> ()) {
//        DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: {
//            completion(.success([
//                Friend(id: UUID(), name: "John Knoll", email: "john.knoll@icloud.com", number: "+357-98980876", icon: ""),
//                Friend(id: UUID(), name: "Mohammadreza Khatibi", email: "me@mohammadreza.me", number: "+357-97728266", icon: ""),
//            ]))
//        })
//    }
//}


struct Friend {
    var id: UUID
    var name: String
    var email: String
    var number: String
    var icon: String
}

