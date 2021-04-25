//
//  MedalHeaderCell.swift
//  Reward
//
//  Created by Darshan on 25/04/21.
//

import UIKit

class MedalHeaderCell: UITableViewCell {

    @IBOutlet weak var medalView: UIView!
    @IBOutlet weak var goldCountLabel: UILabel!
    @IBOutlet weak var silverCountLabel: UILabel!
    @IBOutlet weak var bronzeCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUI()
    }
    
    private func setUI() {
        medalView.addShadow(ofColor: R.color.darkGray() ?? .clear, radius: 5, offset: .zero, opacity: 1)
        goldCountLabel.font = goldCountLabel.font.bold
        silverCountLabel.font = silverCountLabel.font.bold
        bronzeCountLabel.font = bronzeCountLabel.font.bold
    }
    
    func configureWithModel() {
        goldCountLabel.text = "0"
        silverCountLabel.text = "0"
        bronzeCountLabel.text = "0"
    }

}
