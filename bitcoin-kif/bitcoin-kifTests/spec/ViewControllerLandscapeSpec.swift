////
////  HistoryPortraitViewSpec.swift
////  bitcoin-kifTests
////
////  Created by r.vieira.cavalcante on 04/07/18.
////  Copyright © 2018 r.vieira.cavalcante. All rights reserved.
////
//
//import Foundation
//import Quick
//import Nimble
//import Nimble_Snapshots
//import KIF_Quick
//@testable import bitcoin_kif
//
//
//class ViewControllerLandscapeSpec: KIFSpec {
//    override func spec() {
//        
//        describe("ViewControllerSpec behavior") {
//            var action: HistoryActionMock!
//            var service: HistoryServiceMock!
//            var window: UIWindow!
//            var navigationController: UINavigationController!
//            
//            beforeEach {
//                action = HistoryActionMock()
//                service = HistoryServiceMock()
//            }
//            
//            context("landscape layout") {
//                
//                beforeEach {
//                    let history = History.getHistory()
//                    
//                    service.result = .success(history)
//                    
//                    let viewController = ViewController(service: service)
//                    
//                    navigationController = UINavigationController(rootViewController: viewController)
//                    navigationController.navigationBar.isTranslucent = false
//                    
//                    window = UIWindow(frame: CGRect(x:0, y:0, width: 320, height: 564))
//                    window.rootViewController = navigationController
//                    window.makeKeyAndVisible()
//                    
//                    XCUIDevice.shared.orientation = .landscapeLeft
//                }
//                
//                afterEach {
//                    window.isHidden = true
//                    window = nil
//                }
//                
//                it("default view") {
//                    viewTester().usingIdentifier("chart").waitForAnimationsToFinish()
//                    expect(window).toEventually(recordSnapshot(named: "default landscape view"))
//                }
//            }
//        }
//    }
//}
//
//
