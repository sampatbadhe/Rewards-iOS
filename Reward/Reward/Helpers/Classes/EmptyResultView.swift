//
//  EmptyResultView.swift
//  Reward
//
//  Created by Keval Vadoliya on 30/04/21.
//

import UIKit

class EmptyResultView: UIView {

    var xibName = "EmptyResultView"
    @IBOutlet private var contentView: UIView!
    @IBOutlet weak private var imageViewContainerView: UIView!
    @IBOutlet weak private var resultImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var messageLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        updateSubviewsProperties()
    }

    @objc dynamic open var titleText: String = String() {
        didSet {
            updateTitleLabelText()
        }
    }

    private func updateTitleLabelText() {
        titleLabel.text = titleText
    }

    @objc dynamic open var messageText: String = String() {
        didSet {
            updateMessageLabelText()
        }
    }

    private func updateMessageLabelText() {
        messageLabel.text = messageText
    }

    @objc dynamic open var titleTextColor: UIColor = R.color.text() ?? .black {
        didSet {
            updateTitleLabelTextColor()
        }
    }

    private func updateTitleLabelTextColor() {
        titleLabel.textColor = titleTextColor
    }

    @objc dynamic open var messageTextColor: UIColor = R.color.text() ?? .black {
        didSet {
            updateMessageLabelTextColor()
        }
    }

    private func updateMessageLabelTextColor() {
        messageLabel.textColor = messageTextColor
    }
    
    @objc dynamic open var titleFont: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline) {
        didSet {
            updateTitleLabelFont()
        }
    }

    private func updateTitleLabelFont() {
        titleLabel.font = titleFont
        titleLabel.adjustsFontForContentSizeCategory = true
    }

    @objc dynamic open var messageFont: UIFont = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline) {
        didSet {
            updateMessageLabelFont()
        }
    }

    private func updateMessageLabelFont() {
        messageLabel.font = messageFont
        messageLabel.adjustsFontForContentSizeCategory = true
    }

    @objc dynamic open var image: UIImage? {
        didSet {
            setImage()
        }
    }

    private func setImage() {
        guard let image = image else {
            return
        }
        resultImageView.image = image
    }

    @objc dynamic open var isTitleHidden: Bool = false {
        didSet {
            updateTitleVisibility()
        }
    }

    private func updateTitleVisibility() {
        titleLabel.isHidden = isTitleHidden
    }

    @objc dynamic open var isMessageHidden: Bool = false {
        didSet {
            updateMessageVisibility()
        }
    }

    private func updateMessageVisibility() {
        messageLabel.isHidden = isMessageHidden
    }

    private func updateSubviewsProperties() {
        updateTitleLabelText()
        updateMessageLabelText()
        updateTitleLabelTextColor()
        updateMessageLabelTextColor()
        updateTitleLabelFont()
        updateMessageLabelFont()
        setImage()
        updateTitleVisibility()
        updateMessageVisibility()
    }

    func getTitleText() -> String {
        return titleLabel.text ?? String()
    }

    func getMessageText() -> String {
        return messageLabel.text ?? String()
    }

    func getTitleFont() -> UIFont {
        return titleLabel.font
    }

    func getMessageFont() -> UIFont {
        return messageLabel.font
    }

    func getTitleTextColor() -> UIColor {
        return titleLabel.textColor
    }

    func getMessageTextColor() -> UIColor {
        return messageLabel.textColor
    }
    
    func getImage() -> UIImage? {
        return resultImageView.image
    }

    func getIsTitleHidden() -> Bool {
        return titleLabel.isHidden
    }

    func getIsMessageHidden() -> Bool {
        return messageLabel.isHidden
    }

}
