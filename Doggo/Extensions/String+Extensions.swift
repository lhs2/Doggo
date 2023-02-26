//
//  String+Extensions.swift
//  Doggo
//
//  Created by Luiz Henrique on 25/02/2023.
//

import Foundation
import UIKit.UIFont

extension String {
    static func convertToAttributedString(with bold: String, regular: String) -> NSAttributedString {
        let attrsBold = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 15)]
        let attributedString = NSMutableAttributedString(string:bold, attributes:attrsBold)

        let attrsRegular = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)]
        let normalString = NSMutableAttributedString(string:regular, attributes: attrsRegular)
        attributedString.append(normalString)
        
        return attributedString
    }
}
