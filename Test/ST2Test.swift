import XCTest

class ST2Test: Singenuity_RegisterUITests {
    func test_ST2_Login() {
        LoginPage.loginStage()
    }
    func test_ST2_2_AddPackageToCart() {
        LoginPage.validateAddItemToCart()
    }
    func test_ST2_3_Check_Out_With_Gift() {
        LoginPage.validateAddItemToCartPayCash()
    }
    
    func test_ST2_4_Send_Consent() {
    }
    func test_ST2_5_Sign_Consent() {
        
    }
    func test_ST2_6_Print_Tickets() {
    }
}
