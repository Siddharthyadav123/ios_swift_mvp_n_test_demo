//
//  UserView.swift
//  TestMVP
//
//  Created by Ranjit singh on 5/31/17.
//  Copyright © 2017 is24. All rights reserved.
//

import Foundation

/**
 * User view protocol which is implimented in view controller
 */
protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(_ users: [UserViewData])
    func setEmptyUsers()
}
