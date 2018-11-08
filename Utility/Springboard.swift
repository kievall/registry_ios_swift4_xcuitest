import Foundation
import UIKit
import XCTest

class Springboard {
    
    let springboard = XCUIApplication(bundleIdentifier: "com....springboard")
    let settings = XCUIApplication(bundleIdentifier: "com.....Preferences")
    func deleteMyApp() {
        XCUIApplication().terminate()
        springboard.activate()
        
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
        sleep(2)
        let icon = springboard.otherElements["Home screen icons"].scrollViews.otherElements.icons["Registry"]
        if icon.exists {
            let iconFrame = icon.frame
            let springboardFrame = springboard.frame
            icon.press(forDuration: 2.5)
            
            springboard.coordinate(withNormalizedOffset: CGVector(dx: ((iconFrame.minX + 3) / springboardFrame.maxX), dy:((iconFrame.minY + 3) / springboardFrame.maxY))).tap()
            Thread.sleep(forTimeInterval: 0.5)
            springboard.buttons["Delete"].firstMatch.tap()
            
            XCUIDevice.shared.press(.home)
            XCUIDevice.shared.press(.home)
            Thread.sleep(forTimeInterval: 0.5)
            
            let settingsIcon = springboard.otherElements["Home screen icons"].scrollViews.otherElements.icons["Settings"]
            if settingsIcon.exists {
                settingsIcon.tap()
                settings.tables.staticTexts["General"].tap()
                settings.tables.staticTexts["Reset"].tap()
                settings.tables.staticTexts["Reset Location & Privacy"].tap()
                if UIDevice.current.userInterfaceIdiom == .pad {
                    settings.buttons["Reset"].tap()
                }
                else {
                    settings.buttons["Reset Warnings"].tap()
                }
                settings.terminate()
            }
        }
    }
}
