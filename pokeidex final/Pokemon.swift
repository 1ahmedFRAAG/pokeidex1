//
//  Pokemon.swift
//  pokeidex final
//
//  Created by admin on 4/20/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String!
    fileprivate var _pokeid: Int!
    
    var name: String {
        return _name
    }
    var pokeid: Int {
        return _pokeid
    }
    init (pokename: String , id: Int){
        self._name = pokename
        self._pokeid = id
    }
}
