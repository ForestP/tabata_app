//
//  EditWorkoutService.swift
//  tabata
//
//  Created by Forest Plasencia on 4/11/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import Foundation
import RealmSwift

class WorkoutDataService {
    private static let _instance = WorkoutDataService()
    
    static var instance : WorkoutDataService {
        return  _instance
    }
    
    lazy var realm = try! Realm()
    let mainWorkout = "main"
    
    // returns the current workout
    func loadCurrentWorkout() -> Workout? {
        let workout = self.realm.object(ofType: Workout.self, forPrimaryKey: self.mainWorkout)
        if workout == nil {
            self.createInitialWorkout()
            return self.loadCurrentWorkout()
        } else {
            return workout
        }
    }
    
    // Creates workout with standard vals
    func createInitialWorkout() {
        let workout = Workout()
        workout.initialCountdown = 3
        workout.exerciseTime = 20
        workout.restTime = 10
        workout.setCount = 8
        workout.cycleCount = 1
        workout.workoutId = self.mainWorkout
        
        try! realm.write {
            self.realm.add(workout)
        }
    }
    
    func editWorkout(workoutData: [String:Int]) {
        let updatedWorkout = Workout(value: workoutData)
        try! realm.write {
            self.realm.add(updatedWorkout, update: true)
        }
    }
    
    func formatWorkoutDescription(workout: Workout) -> String {
        let cycles = self.makeString(count: workout.cycleCount, string: "cycle")
        let sets = self.makeString(count: workout.setCount, string: "set")
        let exerciseTime = self.makeString(count: workout.exerciseTime, string: "second")
        let restTime = self.makeString(count: workout.restTime, string: "second")
        
        let leadingText = "Your tabata workout today will be"
        let description = "\(leadingText) \(cycles) of \(sets) with \(exerciseTime) of exercise and \(restTime) of rest."
        return description
    }
    
    func makeString(count: Int, string: String) -> String {
        var returnString = "\(count) \(string)"
        if count > 1 {
            returnString = "\(returnString)s"
        }
        return returnString
    }
    
}
