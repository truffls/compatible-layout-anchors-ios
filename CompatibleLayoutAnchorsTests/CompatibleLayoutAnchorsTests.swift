//
//  CompatibleLayoutAnchorsTests.swift
//  CompatibleLayoutAnchorsTests
//
//  Created by Lukas Würzburger on 12/11/17.
//  Copyright © 2017 Truffls GmbH. All rights reserved.
//

import XCTest
@testable import CompatibleLayoutAnchors

class CompatibleLayoutAnchorsTests: XCTestCase {

    // MARK: - Variabels

    var viewController: UIViewController!
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!

    // MARK: - Test Case

    override func setUp() {
        super.setUp()
        viewController = UIViewController()
        let view = viewController.view!
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        topConstraint = view.topAnchor.constraint(equalTo: subview.topAnchor, constant: 16)
        bottomConstraint = view.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: 16)
        let left = view.leftAnchor.constraint(equalTo: subview.leftAnchor)
        let right = view.rightAnchor.constraint(equalTo: subview.rightAnchor)
        view.addConstraints(
            [ topConstraint, left, right, bottomConstraint ]
        )
    }

    override func tearDown() {
        viewController.view.subviews.first?.removeFromSuperview()
        topConstraint = nil
        bottomConstraint = nil
        viewController = nil
        super.tearDown()
    }

    // MARK: - Tests

    func testTopLayoutAnchorWasExchanged() {
        let top = topConstraint
        viewController.assignCompatibleConstraint(&topConstraint, for: .top)
        XCTAssertNotEqual(topConstraint, top)
    }

    func testBottomLayoutAnchorWasExchanged() {
        let bottom = bottomConstraint
        viewController.assignCompatibleConstraint(&bottomConstraint, for: .bottom)
        XCTAssertNotEqual(bottomConstraint, bottom)
    }

    func testAssignTopConstraintKeepsConstant() {
        let constant = topConstraint.constant
        viewController.assignCompatibleConstraint(&topConstraint, for: .top)
        XCTAssertEqual(topConstraint.constant, constant)
    }

    func testAssignBottomConstraintKeepsConstant() {
        let constant = bottomConstraint.constant
        viewController.assignCompatibleConstraint(&bottomConstraint, for: .bottom)
        XCTAssertEqual(bottomConstraint.constant, constant)
    }
}
