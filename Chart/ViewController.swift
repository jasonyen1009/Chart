//
//  ViewController.swift
//  Chart
//
//  Created by Yen Hung Cheng on 2023/2/13.
//

import UIKit
import Charts

class ViewController: UIViewController {

    
    @IBOutlet weak var myView: BarChartView!
    
    
    var monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    var temperatureArray:[Double] = [30, 21, 22, 23, 24, 5, 17, 27, 28, 20 ,54, 31, 19]
    
    var dataEntries: [BarChartDataEntry] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0..<monthArray.count {
            dataEntries.append(BarChartDataEntry(x: Double(i), y: temperatureArray[i]))
            
        }
        
        
        // 產生 BarChartDateSet
        let DataSet = BarChartDataSet(entries: dataEntries, label: "temperature")
        
        // 改變 chart 顏色
//        DataSet.colors = ChartColorTemplates.joyful()
        
        // 產生 Data
        let Data = BarChartData(dataSet: DataSet)
        
        // 利用 ChartsView 顯示 BarChartData
        myView.data = Data
        
        // 將 x 方向的格式修改成我們設定的字串
        myView.xAxis.valueFormatter = IndexAxisValueFormatter(values: monthArray)
        
        // 將 x 顯示的資量放到底部
//        myView.xAxis.labelPosition = .bottom
        
    }
    
    

    
    

}

