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
    @IBOutlet weak var allStatusButton: UIButton!
    
    var allStatusAction: ((Any) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
        allStatusButton.setTitle(Constants.Title.checkMyRewardsStatus, for: .normal)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        setUI()
    }
    
    private func setUI() {
        medalView.addShadow(ofColor: R.color.cardShadow() ?? .clear, radius: 5, offset: .zero, opacity: 1)
        goldCountLabel.font = goldCountLabel.font.bold
        silverCountLabel.font = silverCountLabel.font.bold
        bronzeCountLabel.font = bronzeCountLabel.font.bold
    }
    
    func configureWithModel(medalDetails: BadgesModel) {
        goldCountLabel.text = medalDetails.gold.toString
        silverCountLabel.text = medalDetails.silver.toString
        bronzeCountLabel.text = medalDetails.bronze.toString
    }
    
    @IBAction func allStatusButtonAction(_ sender: UIButton) {
        allStatusAction?(sender)
    }

}
