//
//  HistoryPortraitCell.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

class HistoryPortraitCell: CodeViewTableCell {
    
    var bpi: BPI?
    
    lazy var icon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isAccessibilityElement = false
        image.image = UIImage(named: "bitcoin")
        return image
    }()
    
    lazy var labelContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isAccessibilityElement = true
        return stackView
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 16)
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .black
        label.isAccessibilityElement = false
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        label.isAccessibilityElement = false
        return label
    }()
    
    public func setup(bpi: BPI) {
        self.isAccessibilityElement = false
        self.bpi = bpi
        self.dateLabel.text = "Em \(bpi.date.toString())"
        self.valueLabel.text = "\(bpi.value)"
        self.labelContainer.accessibilityIdentifier = bpi.getAccessibility()
        self.labelContainer.accessibilityLabel = bpi.getAccessibility()
    }
    
    override func buildConstrains() {
        
        let iconConstrains: [NSLayoutConstraint] = [
            .left(firstItem: self, secondItem: self.icon, constant: -16),
            .width(view: self.icon, constant: 40),
            .height(view: self.icon, constant: 40),
            .verticalCenter(firstView: self.icon, secondView: self.contentView)
        ]
        
        iconConstrains.active()
        self.icon.setContentHuggingPriority(UILayoutPriority(rawValue: 1000), for: .horizontal)
        
        let containerConstrains: [NSLayoutConstraint] = [
            .aside(left: self.icon, right: self.labelContainer, constant: 16),
            .verticalCenter(firstView: self.labelContainer, secondView: self.contentView),
            .right(firstItem: self.labelContainer, secondItem: self.contentView, constant: -16),
            .top(firstItem: self.labelContainer, secondItem: self.contentView, constant: 10),
            .bottom(firstItem: self.labelContainer, secondItem: self.contentView, constant: -10)
        ]
        
        containerConstrains.active()
    }
    
    override func buildViewHierarchy() {
        self.contentView.addSubview(self.icon)
        self.contentView.addSubview(self.labelContainer)
        
        self.labelContainer.addArrangedSubview(self.dateLabel)
        self.labelContainer.addArrangedSubview(self.valueLabel)
    }
    
    override func setup() {
        self.backgroundColor = .white
    }
}
