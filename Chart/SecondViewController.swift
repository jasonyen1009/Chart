//
//  SecondViewController.swift
//  Chart
//
//  Created by Yen Hung Cheng on 2023/2/14.
//

import UIKit
import Charts

class SecondViewController: UIViewController {

    
    @IBOutlet weak var myView: LineChartView!
    
    
    var monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    var temperatureArray:[Double] = [2, 31, 17, 43, 24, 35, 6, 27, 38, 15 ,30, 47, 32]
    
    var dataEntries: [ChartDataEntry] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        for i in 0..<monthArray.count {
            dataEntries.append(ChartDataEntry(x: Double(i), y: temperatureArray[i]))
        }
        
        
        
        // 產生 BarChartDateSet
        let DataSet = LineChartDataSet(entries: dataEntries, label: "temperature")
        
        // 改變 chart 顏色
//        DataSet.colors = ChartColorTemplates.joyful()
        
        
        // 產生 Data
        let Data = LineChartData(dataSet: DataSet)
        
        // 利用 ChartsView 顯示 BarChartData
        myView.data = Data
        
        // 將 x 方向的格式修改成我們設定的字串
        myView.xAxis.valueFormatter = IndexAxisValueFormatter(values: monthArray)
        
//        myView.xAxis.drawGridLinesEnabled = false
        
    }
    


}
