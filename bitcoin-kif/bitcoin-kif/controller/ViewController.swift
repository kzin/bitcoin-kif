//
//  ViewController.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

class ViewController: UIViewController, HistoryAction {
    
    let loader: HistoryServiceProtocol
    
    let historyView: HistoryContainerView
    
    init(service: HistoryServiceProtocol) {
        self.loader = service
        self.historyView = HistoryContainerView()
        super.init(nibName: nil, bundle: nil)
        self.historyView.action = self
        self.title = "Bitcoin"
        NotificationCenter.default.addObserver(forName: .UIDeviceOrientationDidChange, object: nil, queue: .main) { _ in
            self.historyView.updateOrientation(orientation: self.getOrientation())
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view: UIView
        view = self.historyView
        
        self.view = view
    }
    
    func didSelect(bpi: BPI) {
        let alert = UIAlertController(title: "Bitcoin", message: "Em \(bpi.date.toString()) o valor do bitcoin era de \(bpi.value)", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        self.loader.getHistory { (result) in
            
            self.historyView.setup(result: result, orientation: self.getOrientation())
        }
    }
    
    func getOrientation() -> Orientation {
        if UIDevice.current.orientation.isPortrait {
            return .portrait
        } else {
            return .landscape
        }
    }
}
