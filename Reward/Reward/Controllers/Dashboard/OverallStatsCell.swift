//
//  OverallStatsCell.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import Charts

class OverallStatsCell: UITableViewCell {
    
    @IBOutlet weak var lineChartView: LineChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureChartView()
    }
    
    func configureWithModel(_ overallStats: [OverallStatModel]) {
        lineChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: overallStats.compactMap { $0.date.toString() })
        lineChartView.data = setChartData(overallStats: overallStats)
    }

    private func configureChartView() {
        lineChartView.chartDescription?.enabled = false
        lineChartView.dragEnabled = false
        lineChartView.setScaleEnabled(true)
        lineChartView.pinchZoomEnabled = false
        lineChartView.rightAxis.enabled = false
        lineChartView.doubleTapToZoomEnabled = false
        lineChartView.highlightPerTapEnabled = false
        configureXAxis()
        configureLeftAxis()
    }
    
    private func configureXAxis() {
        let xAxis = lineChartView.xAxis
        xAxis.labelFont = UIFont.preferredFont(forTextStyle: .caption2)
        xAxis.axisLineColor = R.color.border() ?? .lightGray
        xAxis.labelTextColor = R.color.text() ?? .black
        xAxis.axisLineWidth = 1
        xAxis.labelPosition = .bottom
        xAxis.labelRotationAngle = -90
        xAxis.axisMinimum = 0
        xAxis.granularity = 1
        xAxis.drawGridLinesEnabled = false
    }
    
    private func configureLeftAxis() {
        let leftAxis = lineChartView.leftAxis
        leftAxis.labelTextColor = R.color.text() ?? .black
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = false
        leftAxis.granularityEnabled = true
    }
    
    private func setChartData(overallStats: [OverallStatModel]) -> LineChartData{
        let allCategories: [Int] = overallStats.first?.categoryStats.compactMap { $0.categoryId } ?? [Int]()
        var lineChartDataSets: [LineChartDataSet] = []
        for category in allCategories {
            var chartDataEntries: [ChartDataEntry] = []
            var categoryName: String?
            for (index, overallStat) in overallStats.enumerated() {
                guard let firstRecord = overallStat.categoryStats.first(where: {$0.categoryId == category}) else {
                    return LineChartData()
                }
                chartDataEntries.append(ChartDataEntry(x: Double(index), y: Double(arc4random_uniform(4))))
                categoryName = firstRecord.categoryName
            }
            let lineChartDataSet = LineChartDataSet(entries: chartDataEntries, label: categoryName)
            setLineChartDataSet(dataSet: lineChartDataSet, fillColor: CommonUtility().randomColor(), highlightColor: R.color.border() ?? .gray)
            lineChartDataSets.append(lineChartDataSet)
        }
        let data = LineChartData(dataSets: lineChartDataSets)
        data.setValueTextColor(R.color.text() ?? .black)
        data.setValueFont(.systemFont(ofSize: 9))
        return data
    }
    
    private func setLineChartDataSet(dataSet: LineChartDataSet, fillColor: UIColor, highlightColor: UIColor) {
        dataSet.axisDependency = .left
        dataSet.setColor(fillColor)
        dataSet.setCircleColor(R.color.border() ?? .gray)
        dataSet.lineWidth = 2
        dataSet.circleRadius = 2
        dataSet.fillAlpha = 0.25
        dataSet.fillColor = fillColor
        dataSet.highlightColor = highlightColor
        dataSet.drawCircleHoleEnabled = false
        dataSet.drawFilledEnabled = true
        dataSet.drawCirclesEnabled = true
        dataSet.drawValuesEnabled = false
        dataSet.mode = .cubicBezier
    }
    
}
