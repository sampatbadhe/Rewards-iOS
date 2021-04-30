//
//  Snackbar.swift
//  Reward
//
//  Created by Keval Vadoliya on 30/04/21.
//

import Foundation
import TTGSnackbar

class Snackbar {
    
    static let shared = Snackbar()
    private var snackbar = TTGSnackbar()
    
    private init() {}
    
    private func setupSnackbar() {
        snackbar = TTGSnackbar()
        snackbar.duration = .long
        snackbar.backgroundColor = R.color.text()
        snackbar.shouldDismissOnSwipe = true
        snackbar.animationType = .fadeInFadeOut
        snackbar.animationDuration = 0.9
        snackbar.leftMargin = 20
        snackbar.rightMargin = 20
        snackbar.bottomMargin = 40
        snackbar.messageContentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        snackbar.messageTextFont = UIFont().preferredFont(for: .callout, weight: .semibold)
        snackbar.layer.masksToBounds = true
    }

    func show(_ type: SnackbarType = .info, message: SnackbarMessage) {
        snackbar.dismiss()
        setupSnackbar()
        snackbar.message = message.description
        let color = type.color
        snackbar.messageTextColor = color
        snackbar.show()
    }
    
}
