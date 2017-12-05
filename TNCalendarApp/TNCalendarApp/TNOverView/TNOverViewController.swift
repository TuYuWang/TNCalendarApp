//
//  TNOverViewController.swift
//  TNCalendarApp
//
//  Created by 涂育旺 on 2017/10/20.
//  Copyright © 2017年 com.person. All rights reserved.
//

import UIKit
import Charts

class TNOverViewController: TNBaseViewController {

    var topView: TNOverTopView!
    var centerView: TNOverCenterView!
    var chartView: BarChartView!
    var month = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "OVERVIEW"
        setItemType(left: .menu, right: .switchOver, menu: .present)
    
        //topView
        topView = TNOverTopView(frame: CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: 150.toPixel()))
        topView.extensionSeparatorLine(toView: topView, equalToSuperView: true, topToSuperView: false)
        view.addSubview(topView)
        
        //centerView
        centerView = TNOverCenterView(frame: CGRect(x: 0, y: topView.frame.maxY, width: SCREEN_WIDTH, height: 330.toPixel()))
        centerView.extensionSeparatorLine(toView: centerView, equalToSuperView: true, topToSuperView: false)
        view.addSubview(centerView)
        
        //chartView
        chartView = BarChartView()
        chartView.delegate = self
        chartView.chartDescription?.enabled = false
        chartView.pinchZoomEnabled = false
        chartView.doubleTapToZoomEnabled = false
        chartView.drawBarShadowEnabled = false
        chartView.leftAxis.enabled = false
        chartView.rightAxis.enabled = false
        chartView.legend.enabled = false
        chartView.scaleXEnabled = false
        chartView.scaleYEnabled = false
        
        let xAxis = chartView.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelCount = month
        xAxis.labelTextColor = .white
        xAxis.axisMinimum = 0.5
        xAxis.drawAxisLineEnabled = false
        xAxis.drawGridLinesEnabled = false

        
        view.addSubview(chartView)
        
        chartView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(SCREEN_HEIGHT/2, 0, TABBAR_HEIGHT+50.toPixel(), 0))
        }
        
        updateChartData()
    }
    
    func updateChartData() {
        self.setDataCount(month, range: Double(30))
    }
    
    func setDataCount(_ count: Int, range: Double) {
        let yVals = (0..<count).map { (i) -> BarChartDataEntry in
            let val = arc4random()%50
            let val1 = Double(val)
            let val2 = Double(val)
            return BarChartDataEntry(x: Double(i), yValues: [val1, val2])
        }

        let set = BarChartDataSet(values: yVals, label: "month")
        set.drawIconsEnabled = false
        set.colors = [Hex("#ffffff"), Hex("#CAC8E3")]
        set.drawValuesEnabled = false
        
        
        let data = BarChartData(dataSet: set)
        data.highlightEnabled = false
        data.barWidth = 0.4
    
        chartView.data = data
        
    }


}

extension TNOverViewController: ChartViewDelegate {
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        
    }
}
