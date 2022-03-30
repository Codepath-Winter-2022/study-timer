//
//  TimerViewController.swift
//  studyTimer
//
//  Created by Jessica Inthasane on 3/15/22.
//

import UIKit

class TimerViewController: UIViewController {
    
    func timerTask(task: task) {
        seconds = task.workDur
        timerLabel.text = timeString(time: TimeInterval(seconds))
        print(setTime)
    }

    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 0
    var setTime = 0
    var timer = Timer()
    var isTimerRunning = false
    var playPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timerLabel.text = timeString(time: TimeInterval(seconds))
    }
    
    /*
     controls the play pause button, if its the first press play the timer if it is the following press pause the timer
     */
    @IBAction func playpauseButton(_ sender: Any) {
        if isTimerRunning == false{
            runTimer()
            playPressed = true
        }
        else if playPressed == true{
            timer.invalidate()
            playPressed = false
        }
        else{
            runTimer()
            playPressed = true
        }
    }
    
    /*
     if the reset button is pressed stop timer and set time to 0
     */
    @IBAction func resetButton(_ sender: Any) {
        if isTimerRunning == true{
            timer.invalidate()
            seconds = setTime
            isTimerRunning = false
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    /*
     decrements the timer each second and stops the timer when it hits 0
     */
    @objc func updateTimer(){
        if seconds < 1{
            timer.invalidate()
            showPopUp()
            seconds = setTime
            isTimerRunning = false
            timerLabel.text = timeString(time: TimeInterval(seconds))
            //isTimerRunning = false
           // playPressed = false
        }else{
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }
    
    /*
     formats the time displayed to hours minutes seconds
     */
    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    /*
     sends notif when task done
     */
    func showPopUp(){
        let alert = UIAlertController(title: "Time's up!", message: "You've finished a time interval for this task", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default)
        {(action) in
            print(action)
        }
        
        alert.addAction(okayAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    /*
     segue to the home view controller
     */
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
