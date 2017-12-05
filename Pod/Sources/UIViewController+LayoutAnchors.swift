//
//  UIViewController+LayoutAnchors.swift
//  truffls-ios-app
//
//  Created by Lukas Würzburger on 12/5/17.
//  Copyright © 2017 Truffls GmbH. All rights reserved.
//

import UIKit

extension UIViewController {

    var topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        var anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>!
        if #available(iOS 11.0, *) {
            anchor = view.safeAreaLayoutGuide.topAnchor
        } else {
            anchor = topLayoutGuide.bottomAnchor
        }
        return anchor
    }

    var bottomAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        var anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>!
        if #available(iOS 11.0, *) {
            anchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            anchor = bottomLayoutGuide.topAnchor
        }
        return anchor
    }

    func subview(from constraint: NSLayoutConstraint) -> UIView? {
        let constraintItems = [constraint.firstItem, constraint.secondItem]
        guard let views = constraintItems as? [UIView] else { return nil }
        return views.filter({ $0 != view }).first
    }

    func applyTopConstraint(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        guard let subview = subview(from: constraint) else {
            return constraint
        }
        return applyVerticalConstraint(constraint, firstAnchor: subview.topAnchor, secondAnchor: topAnchor)
    }

    func applyBottomConstraint(_ constraint: NSLayoutConstraint) -> NSLayoutConstraint {
        guard let subview = subview(from: constraint) else {
            return constraint
        }
        return applyVerticalConstraint(constraint, firstAnchor: bottomAnchor, secondAnchor: subview.bottomAnchor)
    }

    func applyVerticalConstraint(_ constraint: NSLayoutConstraint, firstAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, secondAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint {
        let newConstraint = firstAnchor.constraint(equalTo: secondAnchor, constant: constraint.constant)
        view.removeConstraint(constraint)
        view.addConstraint(newConstraint)
        return newConstraint
    }
}
