//
//  HistoryAction.swift
//  bitcoin-kifTests
//
//  Created by r.vieira.cavalcante on 04/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation
@testable import bitcoin_kif

class HistoryActionMock: HistoryAction {
    
    var didSelectAction = false
    var selectedBPI: BPI?
    
    func didSelect(bpi: BPI) {
        didSelectAction = true
        selectedBPI = bpi
    }
}
