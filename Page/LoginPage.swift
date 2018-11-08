import XCTest

class LoginPage: Singenuity_RegisterUITests {
    static func changeQaToDev(){
        if devapiBtn.exists{
        }
        else{
            stapiBtn.tap()
            devapiTxtLoc.tap()
        }
    }
    static func changeDevToQa(){
        if stapiBtn.exists{
        }
        else{
            devapiBtn.tap()
            stapiTxtLoc.tap()
        }
    }
    
    static func loginCl(){
        clientNameTxtFld.tap()
        clientNameTxtFld.typeText(clientTxt)
        nextBtn.tap()
        let login = loginBtn
        waitForExpectation(login, time: 10)
        XCTAssert(login.exists)
    }
    
    static func loginClient() {
        if clientNameTxtFld.exists {
            loginCl()
        }else {
            changeClientBtn.tap()
            loginCl()
        }
    }
    
    static func loginClientInvalidCred() {
        waitForExpectation(clientNameTxtFld, time: 10)
        if clientNameTxtFld.exists {
            let randomClient = Utility.generateRandomStringWithLength(length: 10)
            clientNameTxtFld.tap()
            clientNameTxtFld.typeText(randomClient)
            nextBtn.tap()
            let error = errorMessageBlankClient
            waitForExpectation(error, time: 10)
            XCTAssertTrue(error.exists)
        } else {
            changeClientBtn.tap()
            let randomClient = Utility.generateRandomStringWithLength(length: 10)
            clientNameTxtFld.tap()
            clientNameTxtFld.typeText(randomClient)
            nextBtn.tap()
            let error = errorMessageBlankClient
            waitForExpectation(error, time: 10)
            XCTAssertTrue(error.exists)
        }
    }
    
    private static func changingClientBtn(){
        if clientNameTxtFld.exists {
            print()
        } else {
            changeClientBtn.tap()
        }
    }
    
    static func addDevice(){
        sleep(3)
        if notsetBtn.exists != true {
            print("Device already setup")
        }
        else{
            let random = Utility.generateRandomStringWithLength(length: 10)
            notsetBtn.tap()
            waitForExpectation(registerNameTxtFld, time: 10)
            registerNameTxtFld.tap()
            registerNameTxtFld.typeText(random)
            okBtn.tap()
        }
    }
    
    private static func getClientPageUIElements() -> [XCUIElement] {
        var elements = [XCUIElement]()
        elements.append(clientNameTxtFld)
        elements.append(nextBtn)
        if stapiBtn.exists{
            elements.append(stapiBtn)}
        else if devapiBtn.exists{
            elements.append(devapiBtn)}
        else if demoapiBtn.exists{
            elements.append(demoapiBtn)}
        return elements
    }
    
    static func validateClientPageUIElements() {
        let elements = getClientPageUIElements()
        for element in elements {
            XCTAssert(element.exists, "Client UI element exists")
        }
    }
    
    static func loginLogPage(){
        if clientNameTxtFld.exists{
            loginClient()
        }
        waitForExpectation(emailNameTxtFld, time: 10)
        clearTextFields(fields: emailNameTxtFld)
        clearTextFields(fields: pwdNameTxtFld)
        emailNameTxtFld.tap()
        emailNameTxtFld.typeText(emailTxt)
        pwdNameTxtFld.tap()
        pwdNameTxtFld.typeText(passwordTxt)
        loginBtn.tap()
    }
    
    static func clearLoginFields(){
        if clientNameTxtFld.exists{
            loginClient()
        }
        waitForExpectation(emailNameTxtFld, time: 10)
        clearTextFields(fields: emailNameTxtFld)
        clearTextFields(fields: pwdNameTxtFld)
        emailNameTxtFld.tap()
        emailNameTxtFld.typeText(emailTxt)
        pwdNameTxtFld.tap()
        pwdNameTxtFld.typeText(passwordTxt)
        clearTextFields(fields: emailNameTxtFld)
        clearTextFields(fields: pwdNameTxtFld)
    }
    
    static func loginDev(){
        if devapiBtn.exists{
            loginLogPage()
        }
        else{
            stapiBtn.tap()
            devapiTxtLoc.tap()
            loginLogPage()
        }
    }
    
    static func loginStage(){
        if devapiBtn.exists{
            devapiBtn.tap()
            stapiTxtLoc.tap()
            loginClient()
            loginLogPage()
        }
        else{
            loginLogPage()
        }
    }

    private static func getLoginPageUIElements() -> [XCUIElement] {
        var elements = [XCUIElement]()
        elements.append(logo)
        elements.append(emailNameTxtFld)
        elements.append(pwdNameTxtFld)
        elements.append(loginBtn)
        elements.append(changeClientBtn)
        elements.append(forgotPwdBtn)
        if stapiBtn.exists{
            elements.append(stapiBtn)}
        else if devapiBtn.exists{
            elements.append(devapiBtn)}
        else if demoapiBtn.exists{
            elements.append(demoapiBtn)}
        return elements
    }
    
    static func validateLoginPageUIElements() {
        let elements = getLoginPageUIElements()
        for element in elements {
            XCTAssert(element.exists, "Login UI element exists")
        }
    }
    
    static func validateClientElement(){
        if clientNameTxtFld.exists {
            validateClientPageUIElements()
        } else {
            changeClientBtn.tap()
            validateClientPageUIElements()
        }
    }
    
    static func validateLoginElement(){
        if clientNameTxtFld.exists {
            loginClient()
            validateLoginPageUIElements()
        } else {
            validateLoginPageUIElements()
        }
    }
    
    static func ifClientPresentLogin(){
        if clientNameTxtFld.exists {
            loginDev()
//            loginClient()
            validateLoginWithValidCred()
        } else {
            validateLoginWithValidCred()
        }
    }
    
    static func clientAndloginPageStage(){
        loginStage()
    }
    
    static func validateChangeQaDev() {
        if stapiBtn.exists{
            changeQaToDev()}
        else if devapiBtn.exists{}
        else if demoapiBtn.exists{
            demoapiBtn.tap()
            devapiTxtLoc.tap()}
        XCTAssert(devapiBtn.exists, "Changed to dev environment")
    }
    
    static func validateForgotPassword() {
        if clientNameTxtFld.exists{
            loginCl()
        }
        else {}
        forgotPwdBtn.tap()
        waitForExpectation(safariLoginBtn, time: 10)
        XCTAssert(safariLoginBtn.exists, "Verify Forgot Password with redirection to url")
    }

    static func validateSchedule() {
        validateAddItemsPage()
        addItemsBtn.tap()
        scheduleBtn.tap()
        XCTAssert(upcomingBtn.exists)
    }
    
    static func validatePhotos() {
        validateAddItemsPage()
        addItemsBtn.tap()
        photosBtn.tap()
        XCTAssert(upcomingBtn.exists)
    }
    
    static func validateTours() {
        validateAddItemsPage()
        addItemsBtn.tap()
        packageFirstBtn.tap()
        XCTAssert(adultsTxtFld.exists)
        closeWindBtn.tap()
        packageSecondBtn.tap()
        XCTAssert(adultsTxtFld.exists)
        closeWindBtn.tap()
        packageThirdBtn.tap()
        XCTAssert(adultsTxtFld.exists)
        closeWindBtn.tap()
        packageFourthBtn.tap()
        XCTAssert(adultsTxtFld.exists)
        closeWindBtn.tap()
    }
    
    static func validateAddAdultsUntil10() {
        validateAddItemsPage()
        addItemsBtn.tap()
        packageFirstBtn.tap()
        var n = 0
        for _ in 1...9{
            n += 1
            let nstr = String(n)
            adultsTxtFld.tap()
            adultsTxtFld.typeText(nstr)
            waitForExpectation(day30, time: 10)
            XCTAssert(day30.exists)
            clearTextFields(fields: adultsTxtFld)
        }
    }
    
    static func validateAddAdultsMore10() {
        validateAddItemsPage()
        addItemsBtn.tap()
        packageFirstBtn.tap()
        adultsTxtFld.tap()
        adultsTxtFld.typeText("10")
        waitForExpectation(group10, time: 10)
        XCTAssert(group10.exists)
    }
    
    static func validateAddChildrenUntil10() {
        validateAddItemsPage()
        addItemsBtn.tap()
        packageFirstBtn.tap()
        var n = 0
        for _ in 1...4{
            n += 1
            let nstr = String(n)
            adultsTxtFld.tap()
            adultsTxtFld.typeText(nstr)
            childrenTxtFld.tap()
            childrenTxtFld.typeText(nstr)
            waitForExpectation(day30, time: 10)
            XCTAssert(day30.exists)
            clearTextFields(fields: adultsTxtFld)
            clearTextFields(fields: childrenTxtFld)
        }
    }
    
    static func validateAddChildrenMore10() {
        validateAddItemsPage()
        waitForExpectation(addItemsBtn, time: 10)
        addItemsBtn.tap()
        packageFirstBtn.tap()
        childrenTxtFld.tap()
        childrenTxtFld.typeText("10")
        waitForExpectation(group10, time: 10)
        XCTAssert(group10.exists)
    }
    
    static func validateTodayBtn() {
        validateAddItemsPage()
        waitForExpectation(todayPrevArrawBtn, time: 10)
        todayPrevArrawBtn.tap()
        todaySchedulePageBtn.tap()
        XCTAssertEqual(dr.buttons.element(boundBy: 14).label, getToday())
    }
    
    static func validateArrowsChangeDays() {
        validateAddItemsPage()
        waitForExpectation(todayPrevArrawBtn, time: 10)
        todaySchedulePageBtn.tap()
        XCTAssertEqual(dr.buttons.element(boundBy: 14).label, getToday())
        todayPrevArrawBtn.tap()
        XCTAssertEqual(dr.buttons.element(boundBy: 14).label, getYesterday())
        todaySchedulePageBtn.tap()
        todayNextArrawBtn.tap()
        XCTAssertEqual(dr.buttons.element(boundBy: 14).label, getTomorrow())
    }
    
    static func validateUpcomingMenuElements() {
        var elements = [XCUIElement]()
        validateAddItemsPage()
        upcomingSchedulePageBtn.tap()
        elements.append(showAllBtn)
        elements.append(upcomingBtn)
        elements.append(completeBtn)
        elements.append(canceledBtn)
        elements.append(noShowBtn)
        for element in elements {
            XCTAssert(element.exists, "Upcoming menu elements exists")}
    }
    
    static func validateSearchElementsSchelPage() {
        var elements = [XCUIElement]()
        validateAddItemsPage()
        searchByBoundBtn.tap()
        elements.append(firstNameTxtFld)
        elements.append(lastNameTxtFld)
        elements.append(orderNumberTxtFld)
        elements.append(cardNumberTxtFld)
        elements.append(emailAddressTxtFld)
        elements.append(searchTxtBtn)
        elements.append(closeWindBtn)
        for element in elements {
            XCTAssert(element.exists, "Find customer elements exists")}
    }
    
    static func validateLoginWithValidCred() {
//        loginStage()
        loginDev()
        sleep(5)
        if notsetBtn.exists {
            addDevice()
            closeWindBtn.tap()
            let element = upcomingBtn
            if errorMessageBlankPassword.exists{
                changeQaToDev()
                waitForExpectation(element, time: 10)
                XCTAssert(element.exists)
            }else{
                waitForExpectation(element, time: 10)
                XCTAssert(element.exists)
            }
        }
        else{
        }
    }
    
    static func validateLoginWithInvalidCred() {
        if clientNameTxtFld.exists{
            loginClient()
        }
        let randomUsr = Utility.generateRandomStringWithLength(length: 10)
        emailNameTxtFld.tap()
        emailNameTxtFld.typeText(randomUsr)
        pwdNameTxtFld.tap()
        pwdNameTxtFld.typeText(randomUsr)
        loginBtn.tap()
        if errorMessageBlankPassword.exists{
            let element = errorMessageBlankPassword
            XCTAssert(element.exists)
        }
        else{
            waitForExpectation(errorMessageInvalidEmailPassw, time: 10)
            let element = errorMessageInvalidEmailPassw
            XCTAssert(element.exists)
        }
    }

    static func validateAddItemsPage(){
        ifClientPresentLogin()
        let random = Utility.generateRandomStringWithLength(length: 10)
        sleep(3)
        if notsetBtn.exists != true {
        }
        else{
            notsetBtn.tap()
            waitForExpectation(registerNameTxtFld, time: 10)
            registerNameTxtFld.tap()
            registerNameTxtFld.typeText(random)
            okBtn.tap()
            closeWindBtn.tap()
            waitForExpectation(balanceTxtEl, time: 10)
            let bal = balanceTxtEl
            XCTAssert(bal.exists)
        }
    }
    
    static func overbookingSkip(){
        if overbooking.exists{
            canceledBtn.tap()
        }
    }
    
    static func addCustomerInfo(){
        firstNameTxtFld.tap()
        firstNameTxtFld.typeText(firstNameTxt)
        lastNameTxtFld.tap()
        lastNameTxtFld.typeText(lastNameTxt)
        areaTxtFld.tap()
        areaTxtFld.typeText(areaTxt)
        numberPhoneTxtFld.tap()
        numberPhoneTxtFld.typeText(numberPhoneTxt)
        emailAddressTxtFld.tap()
        emailAddressTxtFld.typeText(emailAddressTxt)
        continueBtn.tap()
    }
    
    static func passcodeStage(){
        number2Btn.tap()
        number4Btn.tap()
        number8Btn.tap()
        number2Btn.tap()
    }
    
    static func passcodeDev(){
        number5Btn.tap()
        number9Btn.tap()
        number2Btn.tap()
        number6Btn.tap()
    }
    
    static func addPaymentInfoCash(){
        cashBtn.tap()
        cashTxtFld.tap()
        cashTxtFld.typeText("100.00")
        continueBtn.tap()
        passcodeStage()
    }
    
    static func creditCardFillOutInvalidCred(){
        addCardTxtLoc.doubleTap()
        addCardTxtLoc.typeText(creditCardTxt)
        waitForExpectation(creditCardMmYyTxtLoc, time: 10)
        creditCardMmYyTxtLoc.tap()
        creditCardMmYyTxtLoc.typeText(creditCardExpTxt)
        creditCardCVVTxtLoc.tap()
        creditCardCVVTxtLoc.typeText(creditCardCVVTxt)
        creditCardZipTxtLoc.tap()
        creditCardZipTxtLoc.typeText(creditCardZipTxt)
        chargeCCBtn.tap()
        waitForExpectation(confirmCancelBtn, time: 10)
        confirmCancelBtn.tap()
    }
    
    static func creditCardFillOutInvalidCredByKeypad(){
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Card Number"]/*[[".cells",".otherElements[\"$50,000 Maximum, $1 Minimum, Swipe Credit Card, Swipe Only, Add Card, Not Activated\"]",".otherElements[\"US\"]",".textFields[\"Add Card\"]",".textFields[\"Card Number\"]",".otherElements[\"Credit Card Field\"]"],[[[-1,4],[-1,3],[-1,2,3],[-1,5,2],[-1,1,2],[-1,0,1]],[[-1,4],[-1,3],[-1,2,3],[-1,5,2],[-1,1,2]],[[-1,4],[-1,3],[-1,2,3]],[[-1,4],[-1,3]]],[0]]@END_MENU_TOKEN@*/.doubleTap()
        waitForExpectation(key4, time: 10)
        //CC
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        key4.tap()
        key2.tap()
        //        exp date
        key1.tap()
        key2.tap()
        key2.tap()
        key0.tap()
        //        cvv
        key0.tap()
        key1.tap()
        key1.tap()
        //        zip
        key9.tap()
        key0.tap()
        key0.tap()
        key1.tap()
        key0.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Charge"]/*[[".cells",".otherElements[\"$50,000 Maximum, $1 Minimum, Swipe Credit Card, Swipe Only, Add Card, Not Activated\"].buttons[\"Charge\"]",".otherElements[\"Credit Card Field\"].buttons[\"Charge\"]",".buttons[\"Charge\"]"],[[[-1,3],[-1,2],[-1,1],[-1,0,1]],[[-1,3],[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        waitForExpectation(dr/*@START_MENU_TOKEN@*/.buttons["Confirm Cancel"]/*[[".buttons[\"Cancel Payment\"]",".buttons[\"Confirm Cancel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/, time: 10)
        dr/*@START_MENU_TOKEN@*/.buttons["Confirm Cancel"]/*[[".buttons[\"Cancel Payment\"]",".buttons[\"Confirm Cancel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/ .tap()
    }
    
    static func addPaymentInfoCreditCard(){
        creditCardBtn.tap()
        continueBtn.tap()
        passcodeStage()
    }
    
    static func addPaymentInfoCheck(){
        checkBtn.tap()
        checkNumberTxtFld.tap()
        checkNumberTxtFld.typeText(checkNumberTxt)
        continueBtn.tap()
        passcodeStage()
    }

    static func addPaymentInfoVoucher(){
        voucherBtn.tap()
        voucherNumberTxtFld.tap()
        voucherNumberTxtFld.typeText(voucherNumberTxt)
        bookingAgentBtn.tap()
        bookingAgentGiftBtn.tap()
        continueBtn.tap()
        passcodeStage()
    }
    
    static func chooseTime(){
        if time745.exists{
            return time745.tap()
        }
        else if time815.exists{
            return time815.tap()
        }
        else if time845.exists{
            return time815.tap()
        }
        else if time915.exists{
            return time915.tap()
        }
        else if time945.exists{
            return time945.tap()
        }
        else if time1015.exists{
            return time1015.tap()
        }
    }
    
    static func chooseSpotsAvailable(){
        if spots12.exists{
            return spots12.tap()
        }
        else if spots11.exists{
            return spots11.tap()
        }
        else if spots10.exists{
            return spots10.tap()
        }
        else if spots9.exists{
            return spots9.tap()
        }
        else if spots8.exists{
            return spots8.tap()
        }
        else if spots7.exists{
            return spots7.tap()
        }
        else if spots6.exists{
            return spots6.tap()
        }
        else if spots5.exists{
            return spots5.tap()
        }
        else if spots4.exists{
            return spots4.tap()
        }
        else if spots3.exists{
            return spots3.tap()
        }
        else if spots2.exists{
            return spots2.tap()
        }
        else if spots1.exists{
            return spots1.tap()
        }
    }

    
    static func getSpotsLeftAvailable()-> XCUIElement{
        let texts = dr.staticTexts
        var items: [XCUIElement] = []
        for i in 0..<texts.count {
            let textElement = texts.element(boundBy: i)
            items.append(textElement)
            if textElement.label.contains("spots left") {
                items.append(textElement)
                print(items)

            }
        }
        return items[2]
}
    
    static func validateAddItemToCart() {
        validateAddItemsPage()
        addItemsBtn.tap()
        packageSecondBtn.tap()
        adultsTxtFld.tap()
        adultsTxtFld.typeText("1")
        chooseTomorrowDay()
        waitForExpectation(addBtn, time: 10)
        chooseSpotsAvailable()
        waitForExpectation(addBtn, time: 10)
//        addBtn.tap()
//        waitForExpectation(checkOutBtn, time: 10)
//        XCTAssert(checkOutBtn.exists)
    }
    
    static func chooseTomorrowDay() {
        clickTomorrow().tap()
    }
    
    static func validateAddItemToCartPayCash(){
        validateAddItemToCart()
        checkOutBtn.tap()
        addCustomerInfo()
        sleep(5)
        addPaymentInfoCash()
        XCTAssert(paidTxtLoc.exists)
    }
    static func validateAddItemToCartPayCreditCardInvalidCred(){
        validateAddItemToCart()
        checkOutBtn.tap()
        addCustomerInfo()
        sleep(5)
        addPaymentInfoCreditCard()
        creditCardFillOutInvalidCred()
    }
    static func validateAddItemToCartPayCheck(){
        validateAddItemToCart()
        checkOutBtn.tap()
        addCustomerInfo()
        sleep(5)
        addPaymentInfoCheck()
        waitForExpectation(paidTxtLoc, time: 10)
        XCTAssert(paidTxtLoc.exists)
    }
    
    static func validateAddItemToCartPayVoucher(){
        validateAddItemToCart()
        checkOutBtn.tap()
        addCustomerInfo()
        sleep(5)
        addPaymentInfoVoucher()
        waitForExpectation(paidTxtLoc, time: 10)
        XCTAssert(paidTxtLoc.exists)
    }
}
