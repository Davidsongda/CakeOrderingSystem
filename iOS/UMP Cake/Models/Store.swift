//
//  Store.swift
//  UMP Cake
//
//  Created by DA SONG on 1/31/18.
//  Copyright © 2018 csci 4950. All rights reserved.
//

import Foundation

struct Store: Codable {
    let name : String
    let store_id : Int
    let phone_number : String
    let opening : Int64
    let closing : Int64
    let address : String
}
