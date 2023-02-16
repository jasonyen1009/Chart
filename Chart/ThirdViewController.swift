//
//  ThirdViewController.swift
//  Chart
//
//  Created by Yen Hung Cheng on 2023/2/14.
//

import UIKit
import Charts

class ThirdViewController: UIViewController {

    @IBOutlet weak var myView: PieChartView!
    var monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    var temperatureArray:[Double] = [20, 21, 22, 23, 24, 25, 26, 27, 28, 29 ,30, 31]
    
    var dataEntries: [PieChartDataEntry] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        for i in 0..<monthArray.count {
//
//            dataEntries.append(PieChartDataEntry(value: temperatureArray[i], label: monthArray[i]))
//
//        }
//
//
//        // 產生 PieChartDataSet
//        let DataSet = PieChartDataSet(entries: dataEntries, label: "")
//
//        // 改變 chart 顏色
//        DataSet.colors = ChartColorTemplates.liberty()
//
//        // 產生 Data
//        let Data = PieChartData(dataSet: DataSet)
//
//
//        // 利用 ChartsView 顯示 BarChartData
//        myView.data = Data
        
        setChart(dataPoints: monthArray, values: temperatureArray)

        
    }
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        // 產生 PieChartDataEntry
        var dataEntries: [PieChartDataEntry] = []
        // 產生 PieChartDataEntry 每筆資料
        for i in 0..<dataPoints.count {
            dataEntries.append(PieChartDataEntry(value: values[i], label: dataPoints[i]))
        }
        // 產生 PieChartDataSet
        let piechartdataset = PieChartDataSet(entries: dataEntries)
        // 改變 chart 顏色
        piechartdataset.colors = ChartColorTemplates.liberty()
        // 產生 Data
        let piechartdata = PieChartData(dataSet: piechartdataset)
        // 利用 ChartsView 顯示 BarChartData
        myView.data = piechartdata
    }
    

}
