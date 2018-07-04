//
//  CodeViewCell.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

public class CodeViewTableCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.isAccessibilityElement = false
        self.build()
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func build() {
        buildViewHierarchy()
        buildConstrains()
        setup()
    }
    
    func buildViewHierarchy() { }
    
    func buildConstrains() { }
    
    func setup() { }
}
