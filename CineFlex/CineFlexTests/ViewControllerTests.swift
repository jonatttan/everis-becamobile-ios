//
//  ViewControllerTests.swift
//  CineFlexTests
//
//  Created by Jonattan Moises Sousa on 28/04/21.
//

import XCTest
@testable import CineFlex

class ViewControllerTests: XCTestCase {
    var viewC: ViewController!
    var result: Bool!
    
    override func setUp() {
        viewC = ViewController()
    }
    override func tearDown() {
        result = nil
    }
    func testGenerico() {
        viewC.btnPreviousPage("as")
    }
}
