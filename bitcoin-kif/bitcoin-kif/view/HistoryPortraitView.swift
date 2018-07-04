//
//  HistoryPortraitView.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

class HistoryPortraitView: UIView, CodeView {
    
    let action: HistoryAction?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.backgroundColor = .clear
        tableView.accessibilityIdentifier = "HistoryPortraitTableView"
        return tableView
    }()
    
    func buildHierarchy() {
        self.addSubview(tableView)
    }
    
    func buildConstrains() {
        NSLayoutConstraint.inset(view: self.tableView, inSuperview: self).active()
    }
    
    var datasource: SectionDataSource?
    
    func setup(history: History) {
        let dataSections = DividerSection(HistoryPortraitSection(history: history, action: self.action))
        dataSections.register(self.tableView)
        
        self.datasource = SectionDataSource(dataSection: [dataSections])
        
        self.tableView.dataSource = self.datasource
        self.tableView.delegate = self.datasource
        self.tableView.reloadData()
    }
    
    init(action: HistoryAction?) {
        self.action = action
        super.init(frame: .zero)
        self.backgroundColor = .orange
        self.buildViewCoded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
