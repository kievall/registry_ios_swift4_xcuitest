import XCTest

class ST3Test: Singenuity_RegisterUITests {
    func test_ST3_Login() {
        LoginPage.loginStage()
    }
    func test_ST3_2_AddActivityAndMerchandiseToCart() {
        LoginPage.validateAddItemToCart()
    }
    func test_ST3_3_Check_Out_With_Cash() {
        LoginPage.validateAddItemToCartPayCash()
    }
    
    func test_ST3_4_Send_Consent() {
    }
    func test_ST3_5_Sign_Consent() {
        
    }
    func test_ST3_6_Print_Tickets() {
    }
}
