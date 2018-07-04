//
//  SeparatorCell.swift
//  Pods
//
//  Created by Rodrigo Cavalcante on 19/09/17.
//
//

import UIKit

class SeparatorCell: CodeViewTableCell {
    
    lazy var divider: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
        return view
    }()
    
    override func buildConstrains() {
        
        NSLayoutConstraint.inset(view: self.divider, inSuperview: self.contentView).active()
        
        let dividerConstrains: [NSLayoutConstraint] = [
            .height(view: self.divider, constant: 1)
        ]
        
        dividerConstrains.active()
    }
    
    override func buildViewHierarchy() {
        self.contentView.addSubview(self.divider)
    }
    
    override func setup() {
        self.accessibilityElementsHidden = true
        self.contentView.backgroundColor = .white
    }
    
}
