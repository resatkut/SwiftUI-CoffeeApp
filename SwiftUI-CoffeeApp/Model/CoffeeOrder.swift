//
//  CoffeeOrder.swift
//  SwiftUI-CoffeeApp
//
//  Created by Reşat Kut on 4.09.2022.
//

import Foundation


enum CoffeeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct CoffeeOrder: Codable, Identifiable {
    
    let name: String
    let coffeeName: String
    let total: Double
    let size: CoffeeSize
    
    var id: UUID { return UUID() }
}
