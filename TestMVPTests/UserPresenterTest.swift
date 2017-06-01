import XCTest
@testable import TestMVP

/**
 * UserService mock
 */
class UserServiceMock: UserService {
    fileprivate let users: [UserModel]
    init(users: [UserModel]) {
        self.users = users
    }
    override func getUsers(_ callBack: @escaping ([UserModel]) -> Void) {
        callBack(users)
    }
}

/**
 * UserView mock
 */
class UserViewMock : NSObject, UserView{
    var setUsersCalled = false
    var setEmptyUsersCalled = false

    func setUsers(_ users: [UserViewData]) {
        setUsersCalled = true
    }

    func setEmptyUsers() {
        setEmptyUsersCalled = true
    }

    func startLoading() {
    }

    func finishLoading() {
    }

}

/**
 * Testing presenter
 */
class UserPresenterTest: XCTestCase {
    let emptyUsersServiceMock = UserServiceMock(users:[UserModel]())

    let towUsersServiceMock = UserServiceMock(users:[
        UserModel(firstName: "firstname1", lastName: "lastname1", email: "first@test.com", age: 30),
        UserModel(firstName: "firstname2", lastName: "lastname2", email: "second@test.com", age: 24)])
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldSetEmptyIfNoUserAvailable() {
        //given
        let userViewMock = UserViewMock()
        let userPresenterUnderTest = UserPresenter(userService: emptyUsersServiceMock)
        userPresenterUnderTest.attachView(userViewMock)

        //when
        userPresenterUnderTest.getUsers()

        //verify
        XCTAssertTrue(userViewMock.setEmptyUsersCalled)
    }

    func testShouldSetUsers() {
        //given
        let userViewMock = UserViewMock()
        let userPresenterUnderTest = UserPresenter(userService: towUsersServiceMock)
        userPresenterUnderTest.attachView(userViewMock)

        //when
        userPresenterUnderTest.getUsers()

        //verify
        XCTAssertTrue(userViewMock.setUsersCalled)
    }

}
