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

    // MARK: - Test Lifecycle

    override func setUp() {
        super.setUp()
        setupViewControllerWithSubview()
    }

    override func tearDown() {
        tearDownViewController()
        super.tearDown()
    }

    // MARK: - Setup

    func setupViewControllerWithSubview() {
        viewController = UIViewController()
        addSubviewToView(viewController.view)
    }

    func addSubviewToView(_ view: UIView) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subview)
        let constraints = constraintsForView(subview, in: view)
        view.addConstraints(constraints)
    }

    func constraintsForView(_ view: UIView, in superview: UIView) -> [NSLayoutConstraint] {
        topConstraint = superview.topAnchor.constraint(equalTo: view.topAnchor, constant: 16)
        bottomConstraint = superview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 16)
        let left = superview.leftAnchor.constraint(equalTo: view.leftAnchor)
        let right = superview.rightAnchor.constraint(equalTo: view.rightAnchor)
        return [topConstraint, left, right, bottomConstraint]
    }

    func tearDownViewController() {
        viewController.view.subviews.first?.removeFromSuperview()
        topConstraint = nil
        bottomConstraint = nil
        viewController = nil
    }

    // MARK: - Tests

    func testTopLayoutAnchorWasExchanged() {
        let top = topConstraint
        XCTAssertNoThrow(try viewController.assignCompatibleConstraint(&topConstraint, for: .top))
        XCTAssertNotEqual(topConstraint, top)
    }

    func testBottomLayoutAnchorWasExchanged() {
        let bottom = bottomConstraint
        XCTAssertNoThrow(try viewController.assignCompatibleConstraint(&bottomConstraint, for: .bottom))
        XCTAssertNotEqual(bottomConstraint, bottom)
    }

    func testAssignTopConstraintKeepsConstant() {
        let constant = topConstraint.constant
        XCTAssertNoThrow(try viewController.assignCompatibleConstraint(&topConstraint, for: .top))
        XCTAssertEqual(topConstraint.constant, constant)
    }

    func testAssignBottomConstraintKeepsConstant() {
        let constant = bottomConstraint.constant
        XCTAssertNoThrow(try viewController.assignCompatibleConstraint(&bottomConstraint, for: .bottom))
        XCTAssertEqual(bottomConstraint.constant, constant)
    }

    func testAssignTopConstraintWithNilParameter() {
        var constraint: NSLayoutConstraint! = nil
        XCTAssertThrowsError(try viewController.assignCompatibleConstraint(&constraint, for: .top))
    }

    func testAssignBottomConstraintWithNilParameter() {
        var constraint: NSLayoutConstraint! = nil
        XCTAssertThrowsError(try viewController.assignCompatibleConstraint(&constraint, for: .bottom))
    }
}
