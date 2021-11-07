//
//  UIView+Ext.swift
//  Emplea
//
//  Created by Егор Кожемин on 07.11.2021.
//

import UIKit

public extension UIView {
    func showAnimation(_ completionBlock: @escaping () -> Void) {
        isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.1,
                       delay: 0,
                       options: .curveLinear,
                       animations: { [weak self] in
            self?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }) {  (done) in
            UIView.animate(withDuration: 0.1,
                           delay: 0,
                           options: .curveLinear,
                           animations: { [weak self] in
                self?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }) { [weak self] (_) in
                self?.isUserInteractionEnabled = true
                completionBlock()
            }
        }
    }
}

extension UIView {
    func clip(
        cornerRadius: CGFloat = 50.0,
        borderWidth: CGFloat = 1.0,
        borderColor: CGColor = UIColor.lightGray.cgColor
    ) {
        let layer = self.layer
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
    }
    
    func addShadow(
        cornerRadius: CGFloat = 50.0,
        shadowColor: CGColor = UIColor.lightGray.cgColor,
        shadowRadius: CGFloat = 5.0,
        shadowOpacity: Float = 0.6
    ) {
        let layer = self.layer
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor
        layer.shadowOffset = CGSize(width: 2.0, height: 5.0)
        layer.shadowRadius = shadowRadius
//        layer.shadowOpacity = shadowOpacity
    }
    
}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
