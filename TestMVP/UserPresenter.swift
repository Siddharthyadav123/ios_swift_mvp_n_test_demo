import Foundation

/**
 * User presenter
 */
class UserPresenter {
    fileprivate let userService:UserService
    weak fileprivate var userView : UserView?
    
    init(userService:UserService){
        self.userService = userService
    }
    
    func attachView(_ view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers(){
        self.userView?.startLoading()
        userService.getUsers{ [weak self] users in
            self?.userView?.finishLoading()
            if(users.count == 0){
                self?.userView?.setEmptyUsers()
            }else{
                let mappedUsers = users.map{
                    //print(mappedUsers)
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.setUsers(mappedUsers)
            }
            
        }
    }
}
