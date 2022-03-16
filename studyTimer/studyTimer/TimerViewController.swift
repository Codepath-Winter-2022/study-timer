//
//  TimerViewController.swift
//  studyTimer
//
//  Created by Jessica Inthasane on 3/15/22.
//

import UIKit

class TimerViewController: UIViewController, SetTimerViewControllerDelegate {

    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var playPressed = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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

    @IBAction func resetButton(_ sender: Any) {
        if isTimerRunning == true{
            timer.invalidate()
            seconds = 0
            timerLabel.text = timeString(time: TimeInterval(seconds))
            isTimerRunning = false
        }
    }
    
    func runTimer(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(TimerViewController.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
    }
    
    @objc func updateTimer(){
        if seconds < 1{
            timer.invalidate()
        }else{
            seconds -= 1
            timerLabel.text = timeString(time: TimeInterval(seconds))
        }
    }

    func timeString(time: TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func timeChange(time: Int) {
        seconds = time
        timerLabel.text = timeString(time: (TimeInterval(time)))
    }
    
    override func prepare(for segue:UIStoryboardSegue,sender:Any?){
        if let SetTimerViewController = segue.destination as? SetTimerViewController{
            SetTimerViewController.delegate = self
        }
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
