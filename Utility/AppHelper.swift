import XCTest

class AppHelper: HelperBase {
    
    func getElementHeight(_ element: XCUIElement) -> Int {
        return Int(waitElement(element).frame.size.height)
    }
    
    func getElementWidth(_ element: XCUIElement) -> Int {
        return Int(waitElement(element).frame.size.width)
    }
    
    func closeApp() {
        dr.terminate()
    }
    
    func launchApp() {
        dr.launch()
    }
    
    func restartApp() {
        closeApp()
        launchApp()
    }
    
    func isMobileStoreOpen() -> Bool {
        return false // FIXME
    }
    
    func hideApp() {
        XCUIDevice.shared.press(XCUIDevice.Button.home)
    }
    
    func hideApp(sec: UInt32) {
        hideApp()
        sleep(sec)
        openApp()
    }
    
    func openApp() {
        dr.activate()
    }
    
    func getText(_ element: XCUIElement) -> String {
        let label = element.label as String
        let value = element.value as? String
        let text = label.isEmpty ? value : label
        return text ?? ""
    }
    
    func getBundleId() -> String {
        return Bundle.main.bundleIdentifier ?? ""
    }
}
