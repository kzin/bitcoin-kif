//
//  BPI.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation

struct BPI {
    let date: Date
    let value: Double
    
    init(date: String, value: Double) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: date) {
            self.date = date
        } else {
            self.date = Date()
        }
        
        self.value = value
    }
    
    func getAccessibility() -> String {
        return "Em \(date.toString()) o valor do bitcoint era de \(value)"
    }
}

extension Date {
    
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.string(from: self)
    }
    
}
