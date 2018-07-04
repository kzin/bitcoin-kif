//
//  HistoryPortraitCell.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

class HeaderCell: CodeViewTableCell {
    
    lazy var labelContainer: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.isAccessibilityElement = true
        return stackView
    }()
    
    lazy var textField: UITextField = {
        let text = UITextField()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "text field"
        text.textColor = .black
        text.accessibilityIdentifier = "textField"
        text.isAccessibilityElement = true
        return text
    }()
    
    lazy var responseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "text field"
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14)
        label.textColor = .black
        labelContainer.accessibilityIdentifier = "response_label"
        label.isAccessibilityElement = true
        return label
    }()
    
    lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ação", for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(userDidTapButton), for: .touchUpInside)
        button.accessibilityIdentifier = "actionButton"
        button.isAccessibilityElement = true
        return button
    }()
    
    @objc func userDidTapButton() {
        self.responseLabel.text = self.textField.text
    }
    
    override func buildConstrains() {
        
        let containerConstrains: [NSLayoutConstraint] = [
            .left(firstItem: self.labelContainer, secondItem: self.contentView, constant: 16),
            .verticalCenter(firstView: self.labelContainer, secondView: self.contentView),
            .right(firstItem: self.labelContainer, secondItem: self.contentView, constant: -16),
            .top(firstItem: self.labelContainer, secondItem: self.contentView, constant: 10),
            .bottom(firstItem: self.labelContainer, secondItem: self.contentView, constant: -10)
        ]
        
        containerConstrains.active()
    }
    
    override func buildViewHierarchy() {
        self.contentView.addSubview(self.labelContainer)
        self.labelContainer.addArrangedSubview(self.textField)
        self.labelContainer.addArrangedSubview(self.responseLabel)
        self.labelContainer.addArrangedSubview(self.button)
    }
    
    override func setup() {
        self.backgroundColor = .white
    }
}

