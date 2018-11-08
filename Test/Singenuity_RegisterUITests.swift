import XCTest
import Darwin
import Foundation

let device = DeviceHelper()
let help = AppHelper()
let deleteapp = Springboard()
let constant = Constants()
let util = Utility()
let dr = XCUIApplication()
let safari = XCUIApplication(bundleIdentifier: "com.apple.mobilesafari")
let mail = XCUIApplication(bundleIdentifier: "com.apple.mobilemail")


class Singenuity_RegisterUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = true
        dr.launch()
    }
    override func tearDown() {
        super.tearDown()
    }
}

func waitForElementToVisible(_ element: XCUIElement) -> Bool {
    let expectation = XCTKVOExpectation(keyPath: "exists", object: element, expectedValue: true)
    let result = XCTWaiter().wait(for: [expectation], timeout: 10)
    return result == .completed
}

func waitForExpectation(_ element: XCUIElement, time: Double, safe: Bool = false) {
    let expectation = XCTKVOExpectation(keyPath: "exists",object: element, expectedValue: true)
    let result: XCTWaiter.Result = XCTWaiter().wait(for: [expectation], timeout: time)
    if !safe && result != .completed {
        // if expectation is strict and was not fulfilled
        XCTFail("Condition was not satisfied during \(time) seconds")
    }
}

func waitForElementToAppear(element: XCUIElement) -> XCUIElement {
    if !element.waitForExistence(timeout: 20){
    }
    return element
}

func waitElement(_ element: XCUIElement) -> XCUIElement {
    if !element.waitForExistence(timeout: Constants.implicitlyWait) {
        XCTFail("Element not found: " + element.debugDescription)
    }
    return element
}

func clearTextFields(fields: XCUIElement) {
    guard let stringValue = fields.value as? String else {
        return}
    var deleteString = String()
    for _ in stringValue {
        deleteString += XCUIKeyboardKey.delete.rawValue
    }
    fields.tap()
    fields.typeText(deleteString)
}

func getBundleId(){
    print("ID is : " , AppHelper.getBundleId)
}

func getToday() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM d, yyyy"
    let result = formatter.string(from: date)
    return result
}

func getYesterday() -> String {
    let today = Date()
    let yesterday = today.addingTimeInterval(-86400)
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM d, yyyy"
    let result = formatter.string(from: yesterday)
    return result
}

func getTomorrow() -> String {
    let today = Date()
    let tomorrow = today.addingTimeInterval(86400)
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, MMMM d, yyyy"
    let result = formatter.string(from: tomorrow)
    return result
}

func clickTomorrow()-> XCUIElement {
    let today = Date()
    let tomorrow = today.addingTimeInterval(86400)
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    let result = formatter.string(from: tomorrow)
    return dr.staticTexts[result]
}

func clickTomorrowNext()-> XCUIElement {
    let today = Date()
    let tomorrow = today.addingTimeInterval(86400*2)
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    let result = formatter.string(from: tomorrow)
    return dr.staticTexts[result]
}

func clickYesterday()-> XCUIElement {
    let today = Date()
    let tomorrow = today.addingTimeInterval(-86400)
    let formatter = DateFormatter()
    formatter.dateFormat = "d"
    let result = formatter.string(from: tomorrow)
    return dr.staticTexts[result]
}

func arrayOfWorksDays()-> [String] {
    var worksday = [String]()
    let today = Date()
    let formatter = DateFormatter()
    let calendar = Calendar.current
    let components = calendar.dateComponents([.year, .month], from: Date())
    let startOfMonth = calendar.date(from:components)!
    let numberOfDays = calendar.range(of: .day, in: .month, for: startOfMonth)!.upperBound
    let allDays = Array(0..<numberOfDays).map{ calendar.date(byAdding:.day, value: $0, to: startOfMonth)!}
    let workDays = allDays.filter{ !calendar.isDateInWeekend($0) }
    formatter.dateFormat = "d"
    for i in workDays {
        worksday.append(formatter.string(from: i))
    }
    return worksday
}

//private static func getClientPageUIElements() -> [XCUIElement] {
//    var elements = [XCUIElement]()
//    elements.append(clientNameTxtFld)
//    elements.append(nextBtn)
//    if stapiBtn.exists{
//        elements.append(stapiBtn)}
//    else if devapiBtn.exists{
//        elements.append(devapiBtn)}
//    else if demoapiBtn.exists{
//        elements.append(demoapiBtn)}
//    return elements
//}

//    let today = Date()
//    let formatter = DateFormatter()
//    let calendar = Calendar.current
//    let components = calendar.dateComponents([.year, .month], from: Date())
//    let startOfMonth = calendar.date(from:components)!
//    let numberOfDays = calendar.range(of: .day, in: .month, for: startOfMonth)!.upperBound
//    let allDays = Array(0..<numberOfDays).map{ calendar.date(byAdding:.day, value: $0, to: startOfMonth)!}
//    let workDays = allDays.filter{ !calendar.isDateInWeekend($0) }
//    formatter.dateFormat = "d"
//    let result = formatter.string(from: workDays[0])
//    return dr.staticTexts[result]
//}


//    App Store - com.apple.AppStore
//    Calculator - com.apple.calculator
//    Calendar - com.apple.mobilecal
//    Camera - com.apple.camera
//    Clock - com.apple.mobiletimer
//    Compass - com.apple.compass
//    Contacts - com.apple.MobileAddressBook
//    FaceTime - com.apple.facetime
//    Find Friends - com.apple.mobileme.fmf1
//    Find iPhone - com.apple.mobileme.fmip1
//    Game Center - com.apple.gamecenter
//    Health - com.apple.Health
//    iBooks - com.apple.iBooks
//    iTunes Store - com.apple.MobileStore
//    Maps - com.apple.Maps
//    Messages - com.apple.MobileSMS
//    Music - com.apple.Music
//    News - com.apple.news
//    Notes - com.apple.mobilenotes
//    Phone - com.apple.mobilephone
//    Photos - com.apple.mobileslideshow
//    Podcasts - com.apple.podcasts
//    Reminders - com.apple.reminders
//    Settings - com.apple.Preferences
//    Stocks - com.apple.stocks
//    Tips - com.apple.tips
//    Videos - com.apple.videos
//    Voice Memos - com.apple.VoiceMemos
//    Wallet - com.apple.Passbook
//    Watch - com.apple.Bridge
//    Weather - com.apple.weather
// Login Credential
let emailTxt = "@gmail.com"
let passwordTxt = ""
let clientTxt = "climbworks"
let passStageTxt = "8950"
let passDevTxt = "5926"
let emailDevTxt = "...@...com"
let urlForgotPwdTxt = "https://"

// Textfields
let clientNameTxtFld = dr.textFields["Client Name"]
let emailNameTxtFld = dr.textFields["Email"]
let pwdNameTxtFld = dr.secureTextFields["Password"]
let registerNameTxtFld = dr.textFields["Enter register name here"]
let logo = dr.images["logo3"]

//Text
let deviceNameTxtEl = dr.staticTexts["Please enter a device name"]
let deviceNameTxt = "Please enter a device name"
let smokyTxtEl = dr.staticTexts["Smoky Mountains STAGE"]
let settingTxtEl = dr.staticTexts["Settings"]
let deviceTxtEl = dr.staticTexts["Device name"]
let offTxtEl = dr.staticTexts["Off"]
let squareTxtEl = dr.staticTexts["Square reader"]
let toursTxtEl = dr.staticTexts["Tours collapsed by default"]
let registerTxtEl = dr.textFields["Enter register name here"]
let balanceTxtEl = dr.staticTexts["Balance"]
let registerNameTxtEl = dr.staticTexts["Register Name"]
let setRegisterNameTxtEl = dr.staticTexts["Please set the name of this register."]

//Text static AddItem page
let waiverTxtEl = dr.staticTexts["Waiver"]
let adults1TxtEl = dr.staticTexts["1 adult"]
let notesTxtEl = dr.staticTexts["Notes"]
let phoneTxtEl = dr.staticTexts["Phone Number"]
let statudsTxtEl = dr.textFields["Status"]
let particTxtEl = dr.staticTexts["Participants"]
let moreTxtEl = dr.staticTexts["More"]
let tomBlackTxtEl = dr.staticTexts["Tom Black"]

// Buttons
let nextBtn = dr.buttons["NEXT"]
let loginBtn = dr.buttons["LOGIN"]
let changeClientBtn = dr.buttons["Change Client"]
let forgotPwdBtn = dr.buttons["Forgot Password?"]
let safariLoginBtn = safari.buttons["LOGIN"]
let demoapiBtn = dr.buttons["demoapi....com"]
let devapiBtn = dr.buttons["devapi.....com"]
let stapiBtn = dr.buttons["stapi.....com"]
let stapiTxtLoc = dr.staticTexts["stapi.....com"]
let demoapiTxtLoc = dr.staticTexts["demoapi.....com"]
let devapiTxtLoc = dr.staticTexts["devapi.....com"]
let locationBtn = dr.buttons["Location"]
let cashManagBtn = dr.buttons["Cash Management"]
let generalBtn = dr.buttons["General"]
let debugBtn = dr.buttons["Debug"]
let connBtn = dr.buttons["Connect"]
let notsetBtn = dr.buttons["Not Set"]
let okBtn = dr.buttons["OK"]
let cancelBtn = dr.buttons["Cancel"]
let closeWindBtn = dr.buttons["9"]
let iBtn = dr.buttons["i"]
let scheduleBtn = dr.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 0)
let addItemsBtn =  dr.buttons.element(boundBy: 5)
//    let addItemsBtn = dr.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 1)

let photosBtn = dr.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .button).element(boundBy: 2)

let scrollViewsQuery = dr.scrollViews
let collectionViewsQuery = scrollViewsQuery.otherElements.collectionViews
let addBtn = dr.buttons["Add"]
let checkOutBtn = dr.buttons["Check Out"]
let continueBtn = dr.buttons["Continue"]
let packagesBtn = dr.buttons["Packages"]
let packageFirstBtn = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
let packageSecondBtn = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
let packageThirdBtn = collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
let packageFourthBtn = collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
let adultsTxtFld = dr.textFields.matching(identifier: "0").element(boundBy: 0)
let childrenTxtFld = dr.textFields.matching(identifier: "0").element(boundBy: 1)

let package2Btn = scrollViewsQuery.children(matching: .other).element(boundBy: 0).collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element


//Buttons AddItem page
let logoBtn = dr.buttons[" logo"]
let merchBtn = dr.buttons["Merchandise orders"]
let setBtn = dr.buttons["Settings"]
let cashdrBtn = dr.buttons["Cash drawer"]
let wBtn = dr.buttons["W"]
let uBtn = dr.buttons["U"]
let qBtn = dr.buttons["Q"]
let scannerBtn = dr.buttons["j"]
let upcomingBtn = dr.buttons["Upcoming"]
let todayBtn = dr.buttons["Today"]
// Add items page , header : date, arrows, today, upcoming
//    let window = dr.children(matching: .window).element(boundBy: 0)
//    let element = window.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 0)
//    let todaySchedulePageBtn = element.children(matching: .button).element(boundBy: 0)
//    let upcomingSchedulePageBtn = element.children(matching: .button).element(boundBy: 1)
let todaySchedulePageBtn = dr.buttons.element(boundBy: 7)
let upcomingSchedulePageBtn = dr.buttons.element(boundBy: 8)
let showAllBtn = dr.buttons["Show All"]
let completeBtn = dr.buttons["Complete"]
let canceledBtn = dr.buttons["Cancelled"]
let noShowBtn = dr.buttons["No Show"]
let orderNumberTxtFld = dr.textFields["Order number"]
let cardNumberTxtFld = dr.textFields["Card number (last 4 digits)"]
let searchTxtBtn = dr.buttons["Search"]
let findCustomerTxt = "Find a customer"
let searchByBoundBtn = dr.buttons.element(boundBy: 9)
let searchBtn = dr.coordinate(withNormalizedOffset: CGVector(dx:0, dy:0))
let noTimesAvailable = dr.staticTexts["No times available"]
let tourZiplineTxtLoc = dr.staticTexts["Mountaintop Zipline Tour"]
let tourBikingTxtLoc = dr.staticTexts["Mountain Biking"]
let tourSmokyTxtLoc = dr.staticTexts["Smoky Mountain Outdoors - Upper River"]
//    window.children(matching: .other).element(boundBy: 1).buttons["Upcoming"]
//    element.children(matching: .button).element(boundBy: 2)
//    window.buttons["Search"]
let todayPrevArrawBtn = dr.buttons.matching(identifier: "C").element(boundBy: 0)
let todayNextArrawBtn = dr.buttons.matching(identifier: "F").element(boundBy: 0)
//
let phone818Btn = dr.buttons["+1 ... "]
let phone323Btn = dr.buttons["+1 ..."]
let updateBtn = dr.buttons["Updated by  @ Jul  4 2018  2:35AM"]
let createdBtn = dr.buttons["Created by ... @ Jul 16 2018  6:50PM"]
let noneBtn = dr.buttons["None"]
let activitBtn = dr.buttons["Activities"]
// Error messages
let errorMessageBlankClient = dr.staticTexts["That client does not exist"]
let errorMessageBlankPassword = dr.staticTexts["Invalid email address"]
let errorMessageInvalidCredentials = dr.staticTexts["Invalid credentials"]
let errorMessageInvalidEmailPassw = dr.staticTexts["The email or password provided is incorrect."]

// date
let changeDayBtn =  dr.buttons.element(boundBy: 5)
let day26 = dr.staticTexts["26"]
let day27 = dr.staticTexts["27"]
let day28 = dr.staticTexts["28"]
let day29 = dr.staticTexts["29"]
let day30 = dr.staticTexts["30"]
let day31 = dr.staticTexts["31"]

//
let group10 = dr.buttons["Group of 10 or more"]
//time
let time745 = dr.staticTexts["7:45 AM"]
let time815 = dr.staticTexts["8:15 AM"]
let time845 = dr.staticTexts["8:45 AM"]
let time915 = dr.staticTexts["9:15 AM"]
let time945 = dr.staticTexts["9:45 AM"]
let time1015 = dr.staticTexts["10:15 AM"]

//spots
let spots1 = dr.staticTexts["1 spots left"].firstMatch
let spots2 = dr.staticTexts["2 spots left"].firstMatch
let spots3 = dr.staticTexts["3 spots left"].firstMatch
let spots4 = dr.staticTexts["4 spots left"].firstMatch
let spots5 = dr.staticTexts["5 spots left"].firstMatch
let spots6 = dr.staticTexts["6 spots left"].firstMatch
let spots7 = dr.staticTexts["7 spots left"].firstMatch
let spots8 = dr.staticTexts["8 spots left"].firstMatch
let spots9 = dr.staticTexts["9 spots left"].firstMatch
let spots10 = dr.staticTexts["10 spots left"].firstMatch
let spots11 = dr.staticTexts["11 spots left"].firstMatch
let spots12 = dr.staticTexts["12 spots left"].firstMatch

//Add customer information
let firstNameTxtFld = dr.textFields["First name"]
let lastNameTxtFld = dr.textFields["Last name"]
let areaTxtFld = dr.textFields["Area"]
let numberPhoneTxtFld = dr.textFields["Number"]
let emailAddressTxtFld = dr.textFields["Email address"]
//
let firstNameTxt = "Test"
let lastNameTxt = "Test"
let areaTxt = "424"
let numberPhoneTxt = "2855092"
let emailAddressTxt = "qastarting@gmail.com"
// add Payment Info
let creditCardBtn = dr.buttons["Credit Card"]
let cashBtn = dr.buttons["Cash"]
let cashTxtFld = dr.textFields["$0.00"]
let checkBtn = dr.buttons["Check"]
let voucherBtn = dr.buttons["Voucher"]

//passcode
let passcodeEnterTxt = dr.staticTexts["Enter your passcode"]
let number0Btn = dr.buttons["0"]
let number1Btn = dr.buttons["1"]
let number2Btn = dr.buttons["2"]
let number3Btn = dr.buttons["3"]
let number4Btn = dr.buttons["4"]
let number5Btn = dr.buttons["5"]
let number6Btn = dr.buttons["6"]
let number7Btn = dr.buttons["7"]
let number8Btn = dr.buttons["8"]
let number9Btn = dr.buttons.matching(identifier: "9").element(boundBy: 1)
//Paid
let paidTxtLoc = dr.staticTexts["PAID"]
let addCardTxtLoc = dr.textFields["Card Number"]
let creditCardMmYyTxtLoc = dr.textFields["MM/YY"]
let creditCardCVVTxtLoc = dr.textFields["CVV"]
let creditCardZipTxtLoc = dr.textFields["ZIP"]
let chargeCCBtn = dr.buttons["Charge"]
let creditCardTxt = "4242424242424242"
let creditCardExpTxt = "0220"
let creditCardCVVTxt = "212"
let creditCardZipTxt = "90212"
let confirmCancelBtn = dr.buttons["Confirm Cancel"]
let voucherNumberTxtFld = dr.textFields["Enter voucher number"]
let voucherNumberTxt = "9999999"
let bookingAgentBtn = dr.staticTexts["Select booking agent"]
let bookingAgentDiamBtn = dr.staticTexts["Diamond Resorts - Bent Creek"]
let bookingAgentGiftBtn = dr.staticTexts["Gift Certificate"]
let bookingAgentSmokeyBtn = dr.staticTexts["Smokey Mountain Outdoors"]
let checkNumberTxtFld = dr.textFields["#0000"]
let checkNumberTxt = "9999"

// Keys for credit card
let key1 = dr.keys["1"]
let key2 = dr.keys["2"]
let key3 = dr.keys["3"]
let key4 = dr.keys["4"]
let key5 = dr.keys["5"]
let key6 = dr.keys["6"]
let key7 = dr.keys["7"]
let key8 = dr.keys["8"]
let key9 = dr.keys["9"]
let key0 = dr.keys["0"]
let tablesQuery = dr.tables

//allert
let inprogress = dr.activityIndicators["In progress"]
let allert = dr.buttons["!"]
let overbooking = dr.staticTexts["Overbooking Requires Manager Approval"]

