//
//  ErrorRequestView.swift
//  Pods
//
//  Created by Bruno Mazzo on 05/09/17.
//
//

import UIKit

class ErrorView: UIView, CodeView {
    
    lazy var icon: UIImageView = { [unowned self] in
        let image = UIImageView()
        image.image = UIImage(named: "down")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
        }()
    
    lazy var titleLabel: UILabel = { [unowned self] in
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Algo deu errado"
        label.accessibilityIdentifier = "text_error"
        label.accessibilityLabel = "Algo deu errado"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 24)
        label.textColor = .red
        return label
        }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Falha ao receber informações"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.buildViewCoded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        self.addSubview(self.icon)
        self.addSubview(self.titleLabel)
        self.addSubview(self.descriptionLabel)
    }
    
    func buildConstrains() {
        let grid: Float = 8
        let margin: Float = 3 * grid
        
        let iconConstrains: [NSLayoutConstraint] = [
            .horizontalCenter(firstView: self.icon, secondView: self),
            .width(view: self.icon, constant: 50),
            .height(view: self.icon, constant: 40),
            .safeAreaTop(safeAreaItem: self, otherItem: self.icon, constant: -margin)
        ]
        
        iconConstrains.active()
        
        let titleConstrains: [NSLayoutConstraint] = [
            .left(firstItem: self.titleLabel, secondItem: self, constant: margin),
            .right(firstItem: self.titleLabel, secondItem: self, constant: -margin),
            .over(topItem: self.icon, bottomItem: self.titleLabel, constant: 6 * grid)
        ]
        
        titleConstrains.active()
        
        let detailConstrains: [NSLayoutConstraint] = [
            .left(firstItem: self.descriptionLabel, secondItem: self, constant: margin),
            .right(firstItem: self.descriptionLabel, secondItem: self, constant: -margin),
            .over(topItem: self.titleLabel, bottomItem: self.descriptionLabel, constant: 2 * grid)
        ]
        
        detailConstrains.active()
    }
    
    func setup() {
        self.backgroundColor = .white
    }
}

