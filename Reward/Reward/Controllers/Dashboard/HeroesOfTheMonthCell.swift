//
//  HeroesOfTheMonthCell.swift
//  Reward
//
//  Created by Keval Vadoliya on 29/04/21.
//

import UIKit
import Charts

class HeroesOfTheMonthCell: UITableViewCell {

    @IBOutlet weak var barChartView: BarChartView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureChartView()
    }
    
    private func configureChartView() {
        barChartView.chartDescription?.enabled =  false
        barChartView.pinchZoomEnabled = false
        barChartView.drawBarShadowEnabled = false
        barChartView.drawGridBackgroundEnabled = false
        barChartView.drawValueAboveBarEnabled = true
        barChartView.doubleTapToZoomEnabled = false
        barChartView.highlightPerTapEnabled = false
        barChartView.extraBottomOffset = 20
        
        let l = barChartView.legend
        l.horizontalAlignment = .center
        l.verticalAlignment = .bottom
        l.orientation = .horizontal
        l.drawInside = false
        l.font = UIFont().preferredFont(for: .callout, weight: .regular)
        l.formToTextSpace = 10
        
        configureXAxis()
        configureYAxis()
    }
    
    private func configureXAxis() {
        let xAxis = barChartView.xAxis
        xAxis.labelFont = UIFont().preferredFont(for: .subheadline, weight: .regular)
        xAxis.granularity = 1
        xAxis.drawGridLinesEnabled = false
        xAxis.labelPosition = .bottom
    }
    
    private func configureYAxis() {
        let leftAxis = barChartView.leftAxis
        leftAxis.labelFont = UIFont().preferredFont(for: .subheadline, weight: .regular)
        leftAxis.spaceTop = 0
        leftAxis.axisMinimum = 0
        leftAxis.drawGridLinesEnabled = false
        barChartView.rightAxis.enabled = false
    }

    func configureWithModel(_ contributorList: [ContributorModel]) {
        var barChartDataEntries: [BarChartDataEntry] = []
        var dataPoints: [String] = []
        for (index, contributor) in contributorList.enumerated() {
            guard let badges = contributor.badges else {
                return
            }
            let barChartDataEntry = BarChartDataEntry(x: Double(index), yValues: [Double(badges.bronze), Double(badges.silver), Double(badges.gold)])
            barChartDataEntries.append(barChartDataEntry)
            dataPoints.append(contributor.name())
        }
        let set = BarChartDataSet(entries: barChartDataEntries, label: String())
        setLineChartDataSet(dataSet: set, badges: [.bronze, .silver, .gold])
        let data: BarChartData = BarChartData(dataSet: set)
        data.setValueFont(UIFont().preferredFont(for: .subheadline, weight: .regular))
        data.barWidth = 0.25
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: dataPoints)
        barChartView.data = data
    }
    
    private func setLineChartDataSet(dataSet: BarChartDataSet, badges: [Badges]) {
        dataSet.drawIconsEnabled = false
        dataSet.colors = badges.compactMap({ $0.color })
        dataSet.stackLabels = badges.compactMap({ $0.rawValue })
        dataSet.drawValuesEnabled = false
    }

}
