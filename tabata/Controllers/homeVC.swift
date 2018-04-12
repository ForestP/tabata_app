//
//  ViewController.swift
//  tabata
//
//  Created by Forest Plasencia on 4/8/18.
//  Copyright © 2018 Forest Plasencia. All rights reserved.
//

import UIKit

class homeVC: UIViewController {
    @IBOutlet weak var workoutDescriptionLbl: UILabel!
    
    let workoutSegue = "goToWorkout"
    let editSegue = "goToEdit"
    
    let wds = WorkoutDataService.instance
    
    var currentWorkout: Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the users workout
        self.currentWorkout = self.wds.loadCurrentWorkout()
        self.updateWorkoutDescription()
    }

    func updateWorkoutDescription() {
        if let workout = self.currentWorkout {
            self.workoutDescriptionLbl.text = self.wds.formatWorkoutDescription(workout: workout)
        }
    }
    
    @IBAction func editWorkoutpressed(_ sender: Any) {
    }
    
    @IBAction func getStartedPressed(_ sender: Any) {
    }
    
}

