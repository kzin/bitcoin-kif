//
//  DividerSection.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit

struct DividerSection: Section {
    
    let dataSection: Section
    
    public init(_ dataSection: Section) {
        self.dataSection = dataSection
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rows = self.dataSection.tableView(tableView, numberOfRowsInSection: section)
        
        return max(rows * 2 - 1, 0)
    }
    
    public func register(_ tableView: UITableView) {
        tableView.register(SeparatorCell.self, forCellReuseIdentifier: "divider")
        self.dataSection.register(tableView)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row % 2
        
        if index == 0 {
            return self.dataSection.tableView(tableView, cellForRowAt: IndexPath(row: indexPath.row / 2, section: indexPath.section))
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "divider", for: indexPath)
            
            return cell
        }
    }
    
    public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            self.dataSection.tableView(tableView, didSelectRowAt: IndexPath(row: indexPath.row / 2, section: indexPath.section))
        }
    }
    
}
