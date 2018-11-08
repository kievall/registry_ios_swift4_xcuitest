import XCTest
class HelperBase {
    
    func getCurrentMillis() -> Double {
        return Date().timeIntervalSince1970 * 1000
    }
    
    func isElementPresent(element: XCUIElement, waitTime: Double) -> Bool {
        return element.waitForExistence(timeout: waitTime)
    }
    
    func isElementPresent(_ element: XCUIElement) -> Bool {
        return element.waitForExistence(timeout: 0)
    }
    
    func isElementLost(element: XCUIElement, waitTime: Double) -> Bool {
        let endTime = getCurrentMillis() + waitTime * 1000
        var elementPresent = true
        while elementPresent && endTime > getCurrentMillis() {
            elementPresent = element.exists
        }
        return !elementPresent
    }
    
    func type(text: String, field: XCUIElement) {
        clear(field: field)
        field.typeText(text)
    }
    
    func clear(field: XCUIElement) {
        guard let stringValue = field.value as? String else {
            return
        }
        
        var deleteString = String()
        for _ in stringValue {
            deleteString += XCUIKeyboardKey.delete.rawValue
        }
        field.typeText(deleteString)
    }
    
    func hideKeyBoard(field: XCUIElement) {
        field.typeText("\n")
    }
    
    func readFile(_ filePath: String) -> String {
        var text = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filePath)
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
        return text
    }
    
    func write(text: String, _ filePath: String, notClean: Bool) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(filePath)
            do {
                try text.write(to: fileURL, atomically: notClean, encoding: .utf8)
            }
            catch {/* error handling here */}
        }
    }
    
    func back() {
        dr.navigationBars.buttons.element(boundBy: 0).tap()
    }
    
    func alert(button: Alert) {
        let buttonIndex = (.right == button) ? 2 : 1
        let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
        let alertBtn = springboard.buttons.element(boundBy: buttonIndex)
        if alertBtn.exists { alertBtn.tap() }
    }
}
