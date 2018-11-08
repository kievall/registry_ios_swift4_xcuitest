import XCTest
import Foundation
class LoginTest: Singenuity_RegisterUITests {
    func test_1_validateChangeQaDev() {
        LoginPage.validateChangeQaDev()
    }
    func test_2_validateForgotPassword() {
        LoginPage.validateForgotPassword()   
    }
    func test_3_validateSchedule() {
        LoginPage.validateSchedule()
    }
    func test_4_validateClearLoginFields() {
        LoginPage.clearLoginFields()
    }
    func test_5_validatePhotos() {
        LoginPage.validatePhotos()
    }
    func test_6_validateTours() {
        LoginPage.validateTours()
    }
    func test_7_validateAddAdultsUntil10() {
        LoginPage.validateAddAdultsUntil10()
    }
    func test_8_validateAddAdultsMore10() {
        LoginPage.validateAddAdultsMore10()
        
    }
    func test_9_validateAddChildrenUntil10() {
        LoginPage.validateAddChildrenUntil10()
    }
    func test_10_validateAddChildrenMore10() {
        LoginPage.validateAddChildrenMore10()
    }
    func test_11_validateTodayBtn() {
         LoginPage.validateTodayBtn()
    }
    func test_12_validateArrowsChangeDays() {
        LoginPage.validateArrowsChangeDays()
    }
    func test_13_validateUpcomingMenuElements() {
        LoginPage.validateUpcomingMenuElements()
    }
    
    func test_14_validateSearchElementsSchelPage() {
        LoginPage.validateSearchElementsSchelPage()
    }
    
    func test_15_validateClientPageElements() {
        LoginPage.validateClientElement()
    }
    func test_16_validateClientPageLogin() {
        LoginPage.loginClient()
    }

    func test_17_validateClientPageInvalidLogin() {
        LoginPage.loginClientInvalidCred()
    }

    func test_18_validateLoginPageElements() {
        LoginPage.validateLoginElement()
    }

    func test_19_validateLoginPageLogin() {
        LoginPage.ifClientPresentLogin()
    }

    func test_20_validateLoginInvalidCred() {
        LoginPage.validateLoginWithInvalidCred()
    }

    func test_21_validateAddItemsPage() {
        LoginPage.validateAddItemsPage()
    }
    func test_8_validateAddItemToCartPayCash() {
        LoginPage.validateAddItemToCartPayCash()
    }
//    func test_9_validateAddItemToCartPayCreditCardInvalidCred() {
//        LoginPage.validateAddItemToCartPayCreditCardInvalidCred()
//    }
//    func test_10_validateAddItemToCartPayCheck() {
//        LoginPage.validateAddItemToCartPayCheck()
//    }
//    func test_11_validateAddItemToCartPayVoucher() {
//        LoginPage.validateAddItemToCartPayVoucher()

        
//    }
//    func test_12_validateConfirmationLetter() {
//    }
//    func test_0_validateActivities() {
//    }
//    func test_0_validatePackages() {
//    }
//    func test_0_validateMerchandise() {
//    }
//    func test_0_validateActitiesAds() {
//    }
//    func test_0_validateCalendar() {
//    }
//    func test_0_validateTourTime() {
//    }
//    func test_0_validateTaxExempt() {
//    }
//    func test_0_validateGroup() {
//    }
//    func test_0_validateScanner() {
//    }
}
