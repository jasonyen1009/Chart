//
//  SecondViewController.swift
//  Chart
//
//  Created by Yen Hung Cheng on 2023/2/14.
//

import UIKit
import Charts

class SecondViewController: UIViewController {

    //MARK: test
    @IBOutlet weak var myView: LineChartView!
    
    
    var monthArray = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]

    var temperatureArray:[Double] = [2, 31, 17, 43, 24, 35, 6, 27, 38, 15 ,30, 47, 32]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setChart(dataPoints: monthArray, values: temperatureArray)
        

    }
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        // 產生 ChartDataEntry
        var dataEntry:[ChartDataEntry] = []
        
        // 產生 ChartDataEntry 每筆資料
        for i in 0..<monthArray.count {
            dataEntry.append(ChartDataEntry(x: Double(i), y: temperatureArray[i]))
        }
        
        // 產生 LineChartDateSet
        let dataSet = LineChartDataSet(entries: dataEntry, label: "temperature")
//        dataSet.colors = [.red]
        // 產生 LineChartDate
        let lineData = LineChartData(dataSet: dataSet)
        
        // 利用 ChartsView 顯示 LineChartData
        myView.data = lineData
        
        
        // 其它設置
        // MARK: chartDataSet
        // 每個數值上的圓半徑數值
        dataSet.circleRadius = 0

        // 折線會採用 水平貝塞爾曲線進行平滑處理
        dataSet.mode = .horizontalBezier

        // 加粗曲線
        dataSet.lineWidth = 1

        // 關閉點擊後的十字線
        dataSet.highlightEnabled = false


        //開啟填充色繪製
        dataSet.drawFilledEnabled = true
        //設置填充色
        dataSet.fillColor = .blue
        //設置填充色透明度
        dataSet.fillAlpha = 1

        // 開啟填充色繪製
        dataSet.drawFilledEnabled = true
        // 漸變顏色數組
        let gradientColors = [UIColor.blue.cgColor, UIColor.white.cgColor] as CFArray
        // 每組顏色所在位置（範圍0~1)
        let colorLocations:[CGFloat] = [1.0, 0.0]
        // 生成漸變色
        let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(),
        colors: gradientColors, locations: colorLocations)
        //將漸變色作為填充對象
        dataSet.fill = LinearGradientFill(gradient: gradient!, angle: 90.0)


        // MARK: lineChartView
        // 關閉 x 軸縮放
        myView.scaleXEnabled = false
        // 關閉 y 軸縮放
        myView.scaleYEnabled = false
        // 關閉雙擊縮放
        myView.doubleTapToZoomEnabled = false


        // 將 x 方向的格式修改成我們設定的字串
        myView.xAxis.valueFormatter = IndexAxisValueFormatter(values: monthArray)

        // x 標籤相對於圖表的位置
        myView.xAxis.labelPosition = .bottom

        // 隱藏 x 垂直的隔線
        myView.xAxis.drawGridLinesEnabled = false
        // 在 X 軸上繪製一條水平的軸線
        myView.xAxis.drawAxisLineEnabled = true

        // 隱藏 y 軸水平線
        myView.leftAxis.drawGridLinesEnabled = false
        myView.rightAxis.drawGridLinesEnabled = false



        // 隱藏 LineChartView 中 x 軸上的標籤
        myView.xAxis.labelTextColor = .clear
        // 隱藏右邊欄位的資料
        myView.rightAxis.enabled = false
        // 隱藏左邊欄位的資料
        myView.leftAxis.enabled = false

        // 隱藏數值文字
        myView.data?.setValueTextColor(.clear)

    }

}
