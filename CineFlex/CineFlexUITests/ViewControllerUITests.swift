//
//  ViewControllerUITests.swift
//  CineFlexUITests
//
//  Created by Jonattan Moises Sousa on 28/04/21.
//

import XCTest

class ViewControllerUITests: QuickSpec {

    override func spec() {
        describe("ViewController") {
            var tela: UIViewController!
            beforeEach {
                tela = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homeScreen")
                _ = tela.view
            }
            it("Tela Principal") {
                expect(tela) == recordSnapshot()
//                expect(tela) == snapshot()
            }
        }
    }
}
