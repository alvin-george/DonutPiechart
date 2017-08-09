//
//  ViewController.swift
//  DonutPiechart
//
//  Created by apple on 09/08/17.
//  Copyright © 2017 apple. All rights reserved.
//

import UIKit
import Charts


class ViewController: UIViewController {
    
    @IBOutlet weak var pieChartView: PieChartView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let months = ["English", "Physics", "Chemistry", "Hindi", "Kannada"]
        let unitsSold = [20,15, 68, 30, 19]

        setChart(dataPoints: months, values: unitsSold)
        
        customizePiechart()
        
        
        //pieChartView.isHidden = true
        
        //updateChartData()
    }
    func customizePiechart()
    {
        pieChartView.holeRadiusPercent = 0.0
        let d = Description()
        d.text = "Marks Distribution"
        pieChartView.chartDescription = d
        pieChartView.centerText = ""
        pieChartView.transparentCircleColor = UIColor.clear
    }
    func setChart(dataPoints: [String], values: [Int]) {
        var entries = [PieChartDataEntry]()
        
        for (index, value) in values.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = Double(value)
            entry.label = dataPoints[index]
            //entry.label = String(value) + "%"

            entries.append( entry)
        }

        let pieChartDataSet = PieChartDataSet(values: entries, label: "Subjects")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        pieChartView.data = pieChartData
        
        
        //Data Set Path Setting
        pieChartDataSet.yValuePosition = .outsideSlice
        pieChartDataSet.xValuePosition = .insideSlice
        pieChartDataSet.valueLineColor =  UIColor.lightGray
        pieChartDataSet.valueLineWidth = 1
        pieChartDataSet.valueLinePart1Length =  1.1
        pieChartDataSet.valueLinePart2Length =  0.3
        //pieChartDataSet.sliceSpace =  10.0
        pieChartDataSet.valueTextColor =  UIColor.black
        pieChartDataSet.valueFont =  UIFont(name: "Arial", size: 13.0)!
        pieChartDataSet.valueLinePart1OffsetPercentage = 0.6
        
        
        var colors: [UIColor] = []
        
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        
        pieChartDataSet.colors = colors
        
    }
    func updateChartData()  {
        
        let chart = PieChartView(frame: self.view.frame)
        // 2. generate chart data entries
        let track = ["Income", "Expense", "Wallet", "Bank"]
        let money = [650, 456.13, 78.67, 856.52]
        
        var entries = [PieChartDataEntry]()
        for (index, value) in money.enumerated() {
            let entry = PieChartDataEntry()
            entry.y = value
            entry.label = track[index]
            entries.append( entry)
        }
        
        // 3. chart setup
        let set = PieChartDataSet( values: entries, label: "Pie Chart")
        // this is custom extension method. Download the code for more details.
        var colors: [UIColor] = []
        
        for _ in 0..<money.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        set.colors = colors
        let data = PieChartData(dataSet: set)
        chart.data = data
        chart.noDataText = "No data available"
        // user interaction
        chart.isUserInteractionEnabled = true
        
        let d = Description()
        d.text = "iOSCharts.io"
        chart.chartDescription = d
        chart.centerText = "Pie Chart"
        chart.holeRadiusPercent = 0.2
        chart.transparentCircleColor = UIColor.clear
        self.view.addSubview(chart)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

