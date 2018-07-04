//
//  HistoryPortraitDataSource.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

protocol Section {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    func register(_ tableView: UITableView)
}

import UIKit

protocol HistoryAction {
    func didSelect(bpi: BPI)
}

class HistoryPortraitSection: Section {
    
    let history: History
    let action: HistoryAction?
    
    init(history: History, action: HistoryAction? = nil) {
        self.history = history
        self.action = action
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.bpi.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if indexPath.row == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath)
            
        } else {
        
            cell = tableView.dequeueReusableCell(withIdentifier: "HistoryPortraitCell", for: indexPath)
            
            if let cell = cell as? HistoryPortraitCell {
                let bpi = self.history.bpi[indexPath.row-1]
                cell.setup(bpi: bpi)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row > 0 {
            self.action?.didSelect(bpi: history.bpi[indexPath.row-1])
        }
    }
    
    func register(_ tableView: UITableView) {
        tableView.register(HistoryPortraitCell.self, forCellReuseIdentifier: "HistoryPortraitCell")
        tableView.register(HeaderCell.self, forCellReuseIdentifier: "HeaderCell")
    }
    
}

class SectionDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    let dataSection: [Section]
    
    init(dataSection: [Section]) {
        self.dataSection = dataSection
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSection[section].tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return dataSection[indexPath.section].tableView(tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataSection[indexPath.section].tableView(tableView, didSelectRowAt: indexPath)
    }
}
