//
//  Items.swift
//  Todoey
//
//  Created by Mariusz Materek on 08/07/2018.
//  Copyright © 2018 Mariusz Materek. All rights reserved.
//

import Foundation

//clasa = Codable = Encodable, Decodable

class Item: Codable {
    
    var title: String = ""
    var done: Bool = false
    
}
