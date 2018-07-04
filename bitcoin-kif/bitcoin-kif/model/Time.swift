//
//  Time.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation

struct Time: Jsonable {
    let updated: String
    let updatedISO: String
    
    init?(json: JsonObject) {
        guard let updated = json["updated"] as? String else {
            return nil
        }
        
        guard let updatedISO = json["updatedISO"] as? String else {
            return nil
        }
        
        self.updated = updated
        self.updatedISO = updatedISO
    }
}
