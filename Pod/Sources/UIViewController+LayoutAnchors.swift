//
//  UIViewController+LayoutAnchors.swift
//  truffls-ios-app
//
//  Created by Lukas Würzburger on 12/5/17.
//  Copyright © 2017 Truffls GmbH. All rights reserved.
//

import UIKit

extension UIViewController {

    public var topAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        var anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>!
        if #available(iOS 11.0, *) {
            anchor = view.safeAreaLayoutGuide.topAnchor
        } else {
            anchor = topLayoutGuide.bottomAnchor
        }
        return anchor
    }

    public var bottomAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor> {
        var anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>!
        if #available(iOS 11.0, *) {
            anchor = view.safeAreaLayoutGuide.bottomAnchor
        } else {
            anchor = bottomLayoutGuide.topAnchor
        }
        return anchor
    }

    private func subview(from constraint: NSLayoutConstraint) -> UIView? {
        let constraintItems = [constraint.firstItem, constraint.secondItem]
        guard let views = constraintItems as? [UIView] else { return nil }
        return views.filter({ $0 != view }).first
    }

    public func compatibleTopConstraint(_ constraint: inout NSLayoutConstraint!) {
        guard let subview = subview(from: constraint) else { return }
        compatibleVerticalConstraint(&constraint, firstAnchor: subview.topAnchor, secondAnchor: topAnchor)
    }

    public func compatibleBottomConstraint(_ constraint: inout NSLayoutConstraint!) {
        guard let subview = subview(from: constraint) else { return }
        compatibleVerticalConstraint(&constraint, firstAnchor: bottomAnchor, secondAnchor: subview.bottomAnchor)
    }

    private func compatibleVerticalConstraint(_ constraint: inout NSLayoutConstraint!, firstAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, secondAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        view.removeConstraint(constraint)
        constraint = firstAnchor.constraint(equalTo: secondAnchor, constant: constraint.constant)
        view.addConstraint(constraint)
    }
}
