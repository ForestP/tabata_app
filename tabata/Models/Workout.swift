//
//  Workout.swift
//  tabata
//
//  Created by Forest Plasencia on 4/11/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import Foundation
import RealmSwift

class Workout: Object {
    @objc dynamic var initialCountdown = 0
    @objc dynamic var exerciseTime = 0
    @objc dynamic var restTime = 0
    @objc dynamic var setCount = 0
    @objc dynamic var cycleCount = 0
    @objc dynamic var workoutId = ""
    
    override static func primaryKey() -> String? {
        return "workoutId"
    }
}



