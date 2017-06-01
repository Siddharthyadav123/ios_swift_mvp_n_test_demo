
import Foundation
/**
 * User service will return dumu data to presenter with some delay like responce of API hit
 */
class UserService {
    
    //the service delivers mocked data with a delay
    func getUsers(_ callBack:@escaping ([UserModel]) -> Void){
        let users = [UserModel(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
                     UserModel(firstName: "Mila", lastName: "Haward", email: "mila@test.om", age: 24),
                     UserModel(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)
        ]
        let delayTime = DispatchTime.now() + Double(Int64(2 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: delayTime) {
            callBack(users)
        }
    }
}
