//
//  HistoryServiceMock.swift
//  bitcoin-kifTests
//
//  Created by r.vieira.cavalcante on 04/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation
@testable import bitcoin_kif

class HistoryServiceMock: HistoryServiceProtocol {
    
    var result: Result<History>? = nil
    var didCallGetHistory = false
    
    func getHistory(completion: @escaping (Result<History>) -> ()) {
        didCallGetHistory = true
        
        if let result = self.result {
            completion(result)
        }
    }
}

