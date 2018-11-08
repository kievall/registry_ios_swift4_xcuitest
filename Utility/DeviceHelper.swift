import XCTest
import AdSupport

class DeviceHelper: HelperBase {
    
    func getScreenWidth() -> Int {
        return Int(dr.frame.size.width)
    }
    
    func getScreenHeight() -> Int {
        return Int(dr.frame.size.height)
    }
    
    private func getSwipeOffset(side: Swipe) -> CGVector {
        if side == .up {
            return CGVector(dx: 0.5, dy: 0)
        } else if side == .right {
            return CGVector(dx: 1, dy: 0.5)
        } else if side == .left {
            return CGVector(dx: -0.3, dy: 0.5)
        } else {
            return CGVector(dx: 0.5, dy: 1)
        }
    }
    
    private func swipe(offset: CGVector) {
        let relativeTouchPoint = dr.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5))
        let relativeOffset = dr.coordinate(withNormalizedOffset: offset)
        relativeTouchPoint.press(forDuration: 0, thenDragTo: relativeOffset)
    }
    
    func swipe(side: Swipe, times: Int, toElement: XCUIElement) {
        if !toElement.exists {
            for _ in 1...times {
                swipe(offset: getSwipeOffset(side: side))
                if toElement.exists { break }
            }
        }
    }
    
    func swipe(side: Swipe, times: Int) {
        for _ in 1...times {
            swipe(offset: getSwipeOffset(side: side))
        }
    }
    
    func swipeRight(times: Int) {
        swipe(side: .right, times: times)
    }
    
    func swipeRight(perElement: XCUIElement) {
        waitElement(perElement).swipeRight()
    }
    
    func swipeLeft(times: Int) {
        swipe(side: .left, times: times)
    }
    
    func swipeLeft(perElement: XCUIElement) {
        waitElement(perElement).swipeLeft()
    }
    
    func swipeDown(times: Int) {
        swipe(side: .down, times: times)
    }
    
    func swipeDown(times: Int, toElement: XCUIElement) {
        swipe(side: .down, times: times, toElement: toElement)
    }
    
    func swipeDown(perElement: XCUIElement) {
        waitElement(perElement).swipeDown()
    }
    
    func swipeUp(times: Int) {
        swipe(side: .up, times: times)
    }
    
    func swipeUp(times: Int, toElement: XCUIElement) {
        swipe(side: .up, times: times, toElement: toElement)
    }
    
    func swipeUp(perElement: XCUIElement) {
        waitElement(perElement).swipeUp()
    }
    
    func tap(_ element: XCUIElement) {
        waitElement(element).tap()
    }
    
    func tap(x: Double, y: Double) {
        let normalized = dr.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: x, dy: y))
        coordinate.tap()
    }
    
    func doubleTap(_ element: XCUIElement) {
        waitElement(element).doubleTap()
    }
    
    func doubleTap(x: Double, y: Double) {
        let normalized = dr.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0))
        let coordinate = normalized.withOffset(CGVector(dx: x, dy: y))
        coordinate.doubleTap()
    }
    
    func longTap(duration: Double, element: XCUIElement) {
        waitElement(element).press(forDuration: duration)
    }
    
    func dragAndDrop(duration: Double, dragElement: XCUIElement, dropElement: XCUIElement) {
        waitElement(dragElement).press(forDuration: duration, thenDragTo: waitElement(dropElement))
    }
    
    func checkThatOsVersionEql(_ version: String) -> Bool {
        return version == getOsVersion()
    }
    
    func getOsVersion() -> String {
        return UIDevice.current.systemVersion
    }
    
    func getElementCentrals(_ element: XCUIElement) -> CGPoint {
        return CGPoint(x: getElementCentralX(element), y: getElementCentralY(element))
    }
    
    func getElementCentralX(_ element: XCUIElement) -> Double {
        return Double(element.frame.midX)
    }
    
    func getElementCentralY(_ element: XCUIElement) -> Double {
        return Double(element.frame.midY)
    }
    
    func landscape() {
        XCUIDevice.shared.orientation = .landscapeLeft
    }
    
    func portrait() {
        XCUIDevice.shared.orientation = .portrait
    }
    
    func getUdid() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    func getAdid() -> String {
        return ASIdentifierManager.shared().advertisingIdentifier.description
    }
}
