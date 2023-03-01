//
//  FourthViewController.swift
//  Chart
//
//  Created by Yen Hung Cheng on 2023/2/25.
//

import UIKit
import Charts

class FourthViewController: UIViewController {

    @IBOutlet weak var horizontalBarChart: HorizontalBarChartView!
    
    
    var monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    var temperatureArray:[Double] = [30, 21, 22, 23, 24, 5, 17, 27, 28, 20 ,54, 31, 19]
    
    var dataEntries: [BarChartDataEntry] = []
    
    
    // 自定義直方圖顏色
    var myColors: [UIColor] = [.red, .orange, .yellow, .green, .blue, .systemRed, .systemGray, .black, .gray, .systemYellow, .systemMint, .purple]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setChart(dataPoints: monthArray, values: temperatureArray)
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        // 產生 barChartEntry
        var dataEntry: [BarChartDataEntry] = []
        
        // 產生 barChartEntry 每筆資料
        for i in 0..<dataPoints.count {
            dataEntry.append(BarChartDataEntry(x: Double(i), y: values[i]))
        }
        
        // 產生 barChartDataSet
        let barChartDataSet = BarChartDataSet(entries: dataEntry, label: "test")
        
        // 設為 單一顏色
        barChartDataSet.colors = [.red]
        
        // 設為 內置的顏色模版 ChartColorTemplates
        barChartDataSet.colors = ChartColorTemplates.material()
        
        // 設為 自己排列的顏色
//        barChartDataSet.colors = myColors
        
        // 產生 barChartData
        let barChartData = BarChartData(dataSet: barChartDataSet)
        
        // 利用 ChartsView 顯示 BarChartData
        horizontalBarChart.data = barChartData

        // 將 x 方向的格式修改成我們設定的字串
        horizontalBarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: monthArray)
        
        
        // barChartView 細部設定
        // 隱藏 x 垂直的隔線
        horizontalBarChart.xAxis.drawGridLinesEnabled = false
        
        // 在 X 軸上繪製一條水平的軸線
        horizontalBarChart.xAxis.drawAxisLineEnabled = true
                
        // 隱藏 y 軸水平線
        horizontalBarChart.leftAxis.drawGridLinesEnabled = false
        horizontalBarChart.rightAxis.drawGridLinesEnabled = false
        
        
        // x 標籤相對於圖表的位置
        horizontalBarChart.xAxis.labelPosition = .bottom

        // 隱藏 LineChartView 中 x 軸上的標籤
//        myView.xAxis.labelTextColor = .clear
        // 隱藏右邊欄位的資料
        horizontalBarChart.rightAxis.enabled = false
        // 隱藏左邊欄位的資料
        horizontalBarChart.leftAxis.enabled = false
                
        // 隱藏數值文字
//        myView.data?.setValueTextColor(.clear)
        
        // 修改 直方的寬度
        barChartData.barWidth = 0.85
        
        // 開啟 直方的陰影
        horizontalBarChart.drawBarShadowEnabled = false
        
        // 直方 的邊框顏色、線寬
//        barChartDataSet.barBorderWidth = 2
//        barChartDataSet.barBorderColor = .red
        
        
        // 關閉點擊後的變色
        barChartDataSet.highlightEnabled = false
                
        // 關閉 x 軸縮放
        horizontalBarChart.scaleXEnabled = false
        // 關閉 y 軸縮放
        horizontalBarChart.scaleYEnabled = true
        // 關閉雙擊縮放
        horizontalBarChart.doubleTapToZoomEnabled = false
                
        
    }
    
    
    

}
