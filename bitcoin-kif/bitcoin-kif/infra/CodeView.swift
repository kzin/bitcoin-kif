//
//  CodeView.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

protocol CodeView {
    func buildHierarchy()
    func buildConstrains()
    func setup()
}

extension CodeView {
    
    func buildViewCoded() {
        self.buildHierarchy()
        self.buildConstrains()
        self.setup()
    }
    
    func buildHierarchy() {
        
    }
    
    func buildConstrains() {
        
    }
    
    func setup() {
        
    }
}
