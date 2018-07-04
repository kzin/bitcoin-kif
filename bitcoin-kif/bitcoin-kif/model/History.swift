//
//  History.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation

public typealias JsonObject = [String : Any]

protocol Jsonable {
    init?(json: JsonObject)
}

enum Result<T> {
    case success(T)
    case error(Error)
    
    func map<N>(_ mapper: (T) throws -> N ) -> Result<N> {
        switch self {
        case .success(let item):
            do {
                let newResult = try mapper(item)
                return .success(newResult)
            } catch let error {
                return .error(error)
            }
            
        case .error(let error):
            return .error(error)
        }
    }
}


struct History: Jsonable {
    
    let bpi: [BPI]
    let disclaimer: String
    let time: Time

    init?(json: JsonObject) {
        
        var bpi = [BPI]()
        if let bpiJson = json["bpi"] as? JsonObject {
            bpiJson.forEach { (arg: (key: String, value: Any)) in
                let (key, value) = arg
                
                if let value = value as? Double {
                    bpi.append(BPI(date: key, value: value))
                }
            }
        }
        
        guard let disclaimer = json["disclaimer"] as? String else {
            return nil
        }
        
        guard let timeJson = json["time"] as? JsonObject, let time = Time(json: timeJson) else {
            return nil
        }
        
        self.bpi = bpi.sorted(by: { $0.date.compare($1.date) == .orderedDescending })
        self.disclaimer = disclaimer
        self.time = time
    }
}
