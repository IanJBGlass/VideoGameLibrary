//
//  Game.swift
//  VideoGameLibrary
//
//  Created by Jacob Glass on 9/10/18.
//  Copyright © 2018 Jacob Glass. All rights reserved.
//

import Foundation

class Game {
    var checkedIn : Bool = false
    var title : String
    var dueDate : Date? = nil
    var genre : String
    init(title : String, genre : String) {
        
        self.title = title
        self.genre = genre
    }
}




