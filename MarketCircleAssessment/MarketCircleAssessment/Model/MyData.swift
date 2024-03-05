//
//  User.swift
//  MarketCircleAssessment
//
//  Created by Sagar Gupta on 05/03/24.
//

import Foundation

struct MyData: Codable {
    let name: String
    let info: Info
}

struct Info: Codable {
    let title: String
    let age: Int
    let phone: String
    let email: String
}


