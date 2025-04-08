//
//  JSONReader.swift
//  Textile Recyling App
//
//  Created by 桃井利久斗 on 2021/07/04.
//

import Foundation

//class JSONReaderRikutoVersion {
//
//
//
//}

struct Shoe: Codable {
    let id: Int
    let name: String
    let latitude: Double
    let longitude: Double
}

struct sampleShoes:Codable {
    let locationOfShoes: [Shoe]
}
