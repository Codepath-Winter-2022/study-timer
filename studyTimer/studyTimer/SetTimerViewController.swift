//
//  SetTimerViewController.swift
//  studyTimer
//
//  Created by Jessica Inthasane on 3/15/22.
//

import UIKit

protocol SetTimerViewControllerDelegate: class {
    func timeChange(time:Int)
    
}

class SetTimerViewController: UIViewController {

    weak var delegate: SetTimerViewControllerDelegate?
    
    @IBOutlet weak var timePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneSetTimeButton(_ sender: Any) {
        delegate?.timeChange(time: Int(timePicker.countDownDuration))
        print(timePicker.countDownDuration)
        print(TimerViewController().seconds)
        self.dismiss(animated: true, completion: nil)
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
