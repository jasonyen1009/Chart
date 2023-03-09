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
        
        
        
        // MARK: PieChartView
        // 字體修改
        piechartdata.setValueFont(.systemFont(ofSize: 13, weight: .medium))
        
        // 字體顏色修改
        piechartdata.setValueTextColor(.black)
        
        // 自定義格式
        let formatter = NumberFormatter()
        // 數字前的單位符號
        formatter.positivePrefix = "$"
        piechartdata.setValueFormatter(DefaultValueFormatter(formatter: formatter))
        
        
        // 改變扇區延伸長度
        piechartdataset.selectionShift = 0
        
        // 設置扇區的間隔
        piechartdataset.sliceSpace = 0
        
        
        // 百分比在內，標籤在外
        piechartdataset.xValuePosition = .outsideSlice
        piechartdataset.yValuePosition = .insideSlice
        
        
        // 禁用圓表旋轉
        myView.rotationEnabled = false
        
        // 設置圓餅圖中間的顯示文字
//        myView.centerText = "temperature"
        
        // 將數值轉為百分比
        myView.usePercentValuesEnabled = true
        
        
        // 將餅圖中心的孔半徑設置為 0，以使中心部分留空
        myView.holeRadiusPercent = 0
        // 設置餅圖中心透明圓的半徑為餅圖半徑的 0.25 倍，以提供視覺效果
        myView.transparentCircleRadiusPercent = 0.25
        // 禁用圓餅圖中心留空
        myView.drawHoleEnabled = false
        
        
        
        
        
        //数值百分比格式化显示
        let pFormatter = NumberFormatter()
        // 設置 numberStyle 屬性為 .percent，以將數字轉換為百分比格式
        pFormatter.numberStyle = .percent
        // 設置 maximumFractionDigits 屬性為 1，以限制小數點後的位數為 1
        pFormatter.maximumFractionDigits = 1
        // multiplier 屬性被設置為 1，以將數字轉換為百分比
        pFormatter.multiplier = 1
        // 設置 percentSymbol 屬性為 "%"，以在百分比值後添加百分比符號
        pFormatter.percentSymbol = "%"
        // 使用 setValueFormatter 方法來將格式化器應用於餅圖的數據中
        // 使用 DefaultValueFormatter 類創建一個新的格式化器，並將其初始化為 pFormatter
        piechartdata.setValueFormatter(DefaultValueFormatter(formatter: pFormatter))
        
        
        
    }
    

}
