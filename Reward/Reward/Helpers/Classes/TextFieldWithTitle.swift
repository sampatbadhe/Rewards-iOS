//
//  TextFieldWithTitle.swift
//  Reward
//
//  Created by Keval Vadoliya on 14/04/21.
//

import UIKit
import SkyFloatingLabelTextField

class TextFieldWithTitle: SkyFloatingLabelTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleFont()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setTitleFont()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setTitleFont()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setTitleFont()
    }
    
    func setTitleFont() {
        titleFont = UIFont.preferredFont(forTextStyle: .caption1)
        adjustsFontForContentSizeCategory = true
    }
    
    private var _titleFormatter: (String) -> String = { (text: String) -> String in
        return text
    }
    
    override var titleFormatter: ((String) -> String) {
        get {
            return _titleFormatter
        }
        set {
            _titleFormatter = newValue
        }
    }
    
}
