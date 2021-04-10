//
//  Json.swift
//  Botalka
//
//  Created by Майя Герасимова on 10.04.2021.
//

import Foundation

struct Database: Decodable{
    var money: Int
    var motivation: [String]
    var pictures: [String]
    var history : [String]
}
