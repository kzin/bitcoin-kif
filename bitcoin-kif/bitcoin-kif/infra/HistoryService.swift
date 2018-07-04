//
//  HistoryService.swift
//  bitcoin-kif
//
//  Created by r.vieira.cavalcante on 04/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation

protocol HistoryServiceProtocol {
    func getHistory(completion: @escaping (Result<History>) -> ())
}

class HistoryService: HistoryServiceProtocol {
    
    let request: Request
    
    init(request: Request) {
        self.request = request
    }
    
    func getHistory(completion: @escaping (Result<History>) -> ()) {
        self.request.request { data in
            switch data {
            case .success(let json):
                if let history = History(json: json) {
                    completion(.success(history))
                } else {
                    completion(.error(NSError.dataError()))
                }
                
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
