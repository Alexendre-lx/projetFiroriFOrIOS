//
//  apiGetter.swift
//  TestFiori4Ios
//
//  Created by Alexendre on 16/01/2020.
//  Copyright © 2020 Alexendre. All rights reserved.
//

import Foundation
let api = apiCalls()


class apiCalls {
    func getPropositions (_ completion : @escaping (propositionsArray) -> ()) {
        if let path = Bundle.main.path(forResource: "propositionsJson", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let user = try! JSONDecoder().decode(propositionsArray.self, from: data)
//                print(user)
                completion(user)
              } catch {
                   print(error)
              }
        }
    }
}
