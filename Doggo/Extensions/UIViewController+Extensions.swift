//
//  UIViewController+Extensions.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import UIKit

extension UIViewController {
    struct Constants {
        static let loadingErrorTitle = "Loading Error"
        static let errorMessage = "There was a problem loading the feed; please check your connection and try again."
        static let okButtonTitle = "OK"
    }
    
    func showError(with title: String = Constants.loadingErrorTitle,
                   message: String = Constants.errorMessage,
                   buttonTitle: String = Constants.okButtonTitle) {
        DispatchQueue.main.async {
            let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: buttonTitle, style: .default))
            self.present(ac, animated: true)
        }
    }
}
