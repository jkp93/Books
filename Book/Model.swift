//
//  Model.swift
//  Book
//
//  Created by 박중권 on 5/9/24.
//

import Foundation

struct Model: Codable {
    let meta: Meta
    let documents: [Document]
}

struct Meta: Codable {
    var isEnd: Bool
    var pageableCount: Int
    var totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
    
}

struct Document: Codable {
    
    var authors: [String]
    var contents: String
    var price: Int
    var title: String
    var thumbnail: String
}
