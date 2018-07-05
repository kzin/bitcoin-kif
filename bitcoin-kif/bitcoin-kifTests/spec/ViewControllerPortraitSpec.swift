//
//  HistoryPortraitViewSpec.swift
//  bitcoin-kifTests
//
//  Created by r.vieira.cavalcante on 04/07/18.
//  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
//

import Foundation
import Quick
import Nimble
import Nimble_Snapshots
import KIF_Quick
@testable import bitcoin_kif


class ViewControllerPortraitSpec: KIFSpec {
    override func spec() {
        
        describe("ViewControllerSpec behavior") {
            var action: HistoryActionMock!
            var service: HistoryServiceMock!
            var window: UIWindow!
            var navigationController: UINavigationController!
            
            beforeEach {
                action = HistoryActionMock()
                service = HistoryServiceMock()
            }
            
            context("error layout") {
                beforeEach {
                    let history = History.getHistory()
                    
                    service.result = .error(NSError.dataError())
                    
                    let viewController = ViewController(service: service)
                    
                    navigationController = UINavigationController(rootViewController: viewController)
                    navigationController.navigationBar.isTranslucent = false
                    
                    window = UIWindow(frame: CGRect(x:0, y:0, width: 320, height: 564))
                    window.rootViewController = navigationController
                    window.makeKeyAndVisible()
                }
                
                afterEach {
                    window.isHidden = true
                    window = nil
                }
                
                it("error view") {
                     XCUIDevice.shared.orientation = .portrait
                    
                    expect(window).toEventually(recordSnapshot(named: "default error view"))
                }
            }
            
            context("portrait layout") {
                
                beforeEach {
                    let history = History.getHistory()
                    
                    service.result = .success(history)
                    
                    let viewController = ViewController(service: service)
                
                    navigationController = UINavigationController(rootViewController: viewController)
                    navigationController.navigationBar.isTranslucent = false
                    
                    window = UIWindow(frame: CGRect(x:0, y:0, width: 320, height: 564))
                    window.rootViewController = navigationController
                    window.makeKeyAndVisible()
                    
                    XCUIDevice.shared.orientation = .portrait
                }
                
                afterEach {
                    window.isHidden = true
                    window = nil
                }
                
                it("default view") {
                    XCUIDevice.shared.orientation = .portrait
                    
                    expect(window).toEventually(recordSnapshot(named: "default portrait view"))
                    
                    XCUIDevice.shared.orientation = .landscapeLeft
                    sleep(2)
                    
                    expect(window).toEventually(recordSnapshot(named: "default landscape view"))
                    
                    XCUIDevice.shared.orientation = .portrait
                    sleep(2)
                }
                
                it("bottom view") {
                     XCUIDevice.shared.orientation = .portrait
                    
                    let lastIndex = IndexPath(row: 60, section: 0)
                    
                    viewTester().usingIdentifier("HistoryPortraitTableView").waitForCellInTableView(at: lastIndex, at: UITableViewScrollPosition.top)
                    
                    viewTester().usingIdentifier("HistoryPortraitTableView")
                    
                    expect(window).toEventually(recordSnapshot(named: "bottom view"))
                }
                
                it("tap view") {
                    XCUIDevice.shared.orientation = .portrait
                    
                    let history = History.getHistory()
                    let bpi = history.bpi[10]
                    
                    viewTester().usingIdentifier("\(bpi.getAccessibility())").tap()
                    
                    expect(window).toEventually(recordSnapshot(named: "tap view"))
                }
                
                it("tap tableview") {
                    XCUIDevice.shared.orientation = .portrait
                    
                    let indexPath = IndexPath(row: 6, section: 0)
                    
                    viewTester().usingIdentifier("HistoryPortraitTableView").tapRowInTableView(at: indexPath)
                    
                    expect(window).toEventually(recordSnapshot(named: "tap tableview"))
                }
                
                it("text") {
                    XCUIDevice.shared.orientation = .portrait
                    
                    viewTester().usingIdentifier("textField").clearAndEnterText("Teste")
                    
                    expect(window).toEventually(recordSnapshot(named: "text"))
                }
                
                it("text and tap") {
                    XCUIDevice.shared.orientation = .portrait
                    
                    viewTester().usingIdentifier("textField").clearAndEnterText("Testando")
                    
                    tester().waitForView(withAccessibilityLabel: "Ação")
                    tester().tapView(withAccessibilityLabel: "Ação")
                    
                    expect(window).toEventually(recordSnapshot(named: "text button"))
                }
            }
        }
    }
}
