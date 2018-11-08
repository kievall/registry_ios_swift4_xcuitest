import Foundation
import XCTest

class activity: NSObject{
    
    
    //header
    var backBtnOnCreateView: XCUIElement {
        return dr.navigationBars["Add Activity"].buttons.element(boundBy: 0)
    }
    
    var doneBtnOnCreateView: XCUIElement {
        return dr.buttons["create_confirm_btn"]
    }
    
    var backBtnOnEditView: XCUIElement {
        return dr.buttons["edit_cancel_btn"]
    }
    
    var doneBtnOnEditView: XCUIElement {
        return dr.buttons["edit_confirm_btn"]
    }
    
    var currentType: XCUIElement {
        return dr.tables.cells.containing(.staticText, identifier: "Type").staticTexts.element(boundBy: 1)
        
    }
    
    func switchType(_ type:String){
        currentType.tap()
        dr.pickerWheels.element.adjust(toPickerWheelValue: type)
        dr.toolbars.buttons.element.tap()
    }
    
    func typeDetails(_ comments: String){
        dr.tables.element(boundBy: 0).swipeUp()
    }
    
    func verifyType(_ type: String) {
        XCTAssertTrue(type == currentType.label, "Current type \(type) is not correct")
    }

    func testEmptyUserNameAndPassword() {
        dr.buttons["Login"].tap()
        
        let alerts = dr.alerts
        let label = dr.alerts.staticTexts["Empty username/password"]
        
        let alertCount = NSPredicate(format: "count == 1")
        let labelExist = NSPredicate(format: "exists == 1")
        
    }
    
    func testLoginSuccessfully() {
        let userNameTextField = dr.textFields["username"]
        userNameTextField.tap()
        userNameTextField.typeText("userName")
        
        let passwordTextField = dr.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        dr.buttons["Login"].tap()
    }
    
    func testSwitchAndCount() {
        
        
        let userNameTextField = dr.textFields["username"]
        userNameTextField.tap()
        userNameTextField.typeText("userName")
        
        let passwordTextField = dr.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("password")
        
        dr.buttons["Login"].tap()
        
        sleep(3)
        
        let switcher = dr.switches["checkin"]
        let l = dr.staticTexts["countLabel"]
        
        switcher.tap()
        XCTAssertEqual(l.label, "1", "Count label should be 1 after clicking check in.")
        
        switcher.tap()
        XCTAssertEqual(l.label, "0", "And 0 after clicking again.")
    }
}
