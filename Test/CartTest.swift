import XCTest

let app = XCUIApplication()

class CartTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
//        app.launchArguments += ["UI-TESTING"]
//        app.launchEnvironment["cart"] = "cart"
        dr.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_1_cartLaunch() {
//        let storyboard = UIStoryboard(name: "Cart.storyboard", bundle: nil)
//        let secondViewController = storyboard.instantiateViewController(withIdentifier: "Cart")
        
       
    }
    
}
