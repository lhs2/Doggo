//
//  UICheckbox.swift
//  Doggo
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
import UIKit

final class UICheckbox: UIButton {
    let checkedImage: UIImage = #imageLiteral(resourceName: "checked_checkbox").withRenderingMode(.alwaysOriginal)
    let uncheckedImage: UIImage = #imageLiteral(resourceName: "unchecked_checkbox").withRenderingMode(.alwaysOriginal)
    
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setBackgroundImage(checkedImage, for: .normal)
            } else {
                self.setBackgroundImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        self.setBackgroundImage(uncheckedImage, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Text.coderNotImplemented)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }
    
}
