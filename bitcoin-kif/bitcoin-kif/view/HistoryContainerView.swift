//
//  HistoryContainerView.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

enum Orientation {
    case portrait
    case landscape
}

class HistoryContainerView: UIView, CodeView {
    
    var history: History?
    var action: HistoryAction?
    
    var currentView: UIView? {
        didSet {
            if let newView = self.currentView {
                super.addSubview(newView)
                newView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.inset(view: newView, inSuperview: self).active()
            }
        }
        
        willSet {
            self.currentView?.removeFromSuperview()
        }
    }
    
    init() {
        self.currentView = UIView()
        super.init(frame: .zero)
        self.buildViewCoded()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildHierarchy() {
        
    }
    
    func buildConstrains() {
    
    }
    
    func updateOrientation(orientation: Orientation) {
        if let history = history {
            self.history = history
        }
        
        switch orientation {
        case .landscape:
            let view = HistoryLandscapeView(action: self.action)
            
            if let history = self.history {
                view.setup(history: history)
            }
            
            self.currentView = view
            
        case .portrait:
            let view = HistoryPortraitView(action: self.action)
            
            if let history = self.history {
                view.setup(history: history)
            }
            
            self.currentView = view
        }
    }
    
    func setup(result: Result<History>, orientation: Orientation) {
        switch result {
        case .success(let history):
            self.history = history
            self.updateOrientation(orientation: orientation)
        case .error(_):
            let view = ErrorView()
            self.currentView = view
        }
    }
}
