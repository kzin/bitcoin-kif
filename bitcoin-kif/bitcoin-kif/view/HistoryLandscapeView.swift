//
//  HistoryPortraitView.swift
//  bitcoint-kif
//
//  Created by r.vieira.cavalcante on 03/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import UIKit
import Charts

class HistoryLandscapeView: UIView, CodeView, IAxisValueFormatter, ChartViewDelegate {
    
    var history: History?
    let action: HistoryAction?
    
    let chartView: BarChartView = {
        let chartView = BarChartView()
        chartView.translatesAutoresizingMaskIntoConstraints = false
        chartView.xAxis.labelPosition = .bottom
        chartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        chartView.xAxis.drawGridLinesEnabled = false
        chartView.xAxis.drawAxisLineEnabled = false
        chartView.noDataText = "Carregando dados..."
        chartView.accessibilityIdentifier = "chart"
        chartView.isAccessibilityElement = false
        return chartView
    }()
    
    func buildHierarchy() {
        self.addSubview(chartView)
    }
    
    func buildConstrains() {
        let inset: UIEdgeInsets = UIEdgeInsets(top: 48.0, left: 24.0, bottom: 16.0, right: 24.0)
        
        NSLayoutConstraint.inset(view: self.chartView, inSuperview: self, withInset: inset).active()
    }
    
    func setup(history: History) {
        self.history = history
        
        var yVals = [BarChartDataEntry]()

        for i in 0...history.bpi.count-1 {
            let bpi = history.bpi[i]
            let entry = BarChartDataEntry(x: Double(i), yValues: [bpi.value])
            entry.accessibilityLabel = bpi.getAccessibility()
            entry.isAccessibilityElement = true
            yVals.append(entry)
        }
        
        let set = BarChartDataSet(values: yVals, label: "Valor do bitcoin nos últimos 30 dias.")
        set.setColor(.orange)
        
        let data = BarChartData(dataSet: set)
        
        self.chartView.delegate = self
    
        self.chartView.xAxis.valueFormatter = self
        self.chartView.data = data
        self.chartView.chartDescription = nil
        self.chartView.reloadInputViews()
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
        guard let history = self.history else {
            return
        }
        
        self.action?.didSelect(bpi: history.bpi[Int(entry.x)])
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        
        guard let history = self.history else {
            return ""
        }
        
        return history.bpi[Int(value)].date.toString()
    }
    
    init(action: HistoryAction?) {
        self.action = action
        super.init(frame: .zero)
        self.backgroundColor = .white
        self.buildViewCoded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

