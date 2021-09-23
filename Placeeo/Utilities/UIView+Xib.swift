//
//  UIView+Xib.swift
//  Placeeo
//
//  Created by Pasha Berger on 23.09.2021.
//

import UIKit

extension UIView {
    static func loadFromNib() -> UIView {
        let bundle = Bundle(for: self)
        return bundle.loadNibNamed(String(describing: self), owner: self, options: nil)?[0] as! UIView
    }
}
