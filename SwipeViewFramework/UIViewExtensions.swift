//
//  UIViewExtensions.swift
//  Audible
//
//  Created by Vijay Vepakomma on 11/26/19.
//  Copyright © 2019 Vijay Vepakomma. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    func anchorToView(view: UIView) {
        anchorToTop(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
    }

    func anchorToTop(top: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
                     left: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
                     bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
                     right: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil) {

        _ = anchorWithConstraints(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant:
        0, rightConstant: 0)
    }

    func anchorToCenter(
            centerX: NSLayoutXAxisAnchor ,
            centerY: NSLayoutYAxisAnchor,
            offsetFromCenter: CGFloat = 0,
            width: CGFloat = 0,
            height: CGFloat =  0
    ) {

        _ = anchorWithConstraints(top: centerY, topConstant: offsetFromCenter, heightConstant: height, widthConstant: width)
        centerXAnchor.constraint(equalTo: centerX).isActive = true
    }

    func anchor(
            top: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
            left: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
            bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
            right: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
            topConstant: CGFloat = 0,
            leftConstant: CGFloat = 0,
            bottomConstant: CGFloat = 0,
            rightConstant: CGFloat = 0,
            heightConstant: CGFloat = 0,
            widthConstant: CGFloat = 0) {

        _ = anchorWithConstraints(top: top, left: left, bottom: bottom, right: right, topConstant: topConstant,
                leftConstant: leftConstant, bottomConstant: bottomConstant, rightConstant: rightConstant,
                heightConstant: heightConstant, widthConstant: widthConstant)
    }

    func clearConstraints(){
        var _superview = self.superview

        while let superview = _superview {
            for constraint in superview.constraints {

                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }

                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }

            _superview = superview.superview
        }

        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }

    func anchorWithConstraints(
            top: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
            left: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
            bottom: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil,
            right: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil,
            topConstant: CGFloat = 0,
            leftConstant: CGFloat = 0,
            bottomConstant: CGFloat = 0,
            rightConstant: CGFloat = 0,
            heightConstant: CGFloat = 0,
            widthConstant: CGFloat = 0) -> Constraints {

        translatesAutoresizingMaskIntoConstraints = false

        let constraints = Constraints()

        if let top = top {
            constraints.topConstraint = topAnchor.constraint(equalTo: top, constant: topConstant)
            constraints.topConstraint?.isActive = true
        }

        if let left = left {
            constraints.leftConstraint = leftAnchor.constraint(equalTo: left, constant: leftConstant)
            constraints.leftConstraint?.isActive = true
        }

        if let bottom = bottom {
            constraints.bottomConstraint = bottomAnchor.constraint(equalTo: bottom, constant: bottomConstant)
            constraints.bottomConstraint?.isActive = true
        }

        if let right = right {
            constraints.rightConstraint = rightAnchor.constraint(equalTo: right, constant: rightConstant)
            constraints.rightConstraint?.isActive = true

        }

        if heightConstant > 0 {
            heightAnchor.constraint(equalToConstant: heightConstant).isActive = true
        }

        if (widthConstant > 0) {
            widthAnchor.constraint(equalToConstant: widthConstant).isActive = true
        }


        return constraints
    }
}
