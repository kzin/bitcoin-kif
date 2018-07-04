//
//  Request.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation
import Alamofire

protocol Request {
    func request(completion: @escaping (Result<JsonObject>) -> ())
}

extension NSError {
    
    static func dataError() -> NSError {
        return NSError(domain: "error", code: 0, userInfo: nil)
    }
    
}

class SDKRequest: Request {
    
    func request(completion: @escaping (Result<JsonObject>)  -> ()) {
        
        Alamofire.request("https://api.coindesk.com/v1/bpi/historical/close.json").responseJSON { response in
            
            switch response.result {
                case .success(let data):
                    
                    if let json = data as? JsonObject {
                        completion(.success(json))
                    } else {
                        completion(.error(NSError.dataError()))
                    }
                
                case .failure(let error):
                    completion(.error(error))
            }
        }
    }
}
