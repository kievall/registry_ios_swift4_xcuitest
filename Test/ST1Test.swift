import XCTest

class ST1Test: Singenuity_RegisterUITests {
    func test_ST1_Login() {
        LoginPage.loginStage()
    }
    func test_ST1_2_AddSingleActivityToCart() {
        LoginPage.validateAddItemToCart()
    }
    func test_ST1_3_Check_Out_With_Cash() {
        LoginPage.validateAddItemToCartPayCash()
    }
    
    func test_ST1_4_Send_Consent() {
        
    }
    func test_ST1_5_Sign_Consent() {
        
          }
    func test_ST1_6_Print_Tickets() {
    }
}
