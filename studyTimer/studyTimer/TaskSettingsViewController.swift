//
//  TaskSettingsViewController.swift
//  studyTimer
//
//  Created by Jessica Inthasane on 3/15/22.
//

import UIKit
/*
 class of a task object
 */
class task{
    var name:String = ""
    var breakDur = 0
    var workDur = 0
    var icon:UIImage? = nil
}

protocol TaskSettingsViewControllerDelegate: AnyObject {
    func retrieveTask(task:task)
    
}

class TaskSettingsViewController: UIViewController {

    weak var delegate: TaskSettingsViewControllerDelegate?
    
    @IBOutlet weak var workTime: UIDatePicker!
    @IBOutlet weak var breakTime: UIDatePicker!
    @IBOutlet weak var taskIcon: UIImageView!
    @IBOutlet weak var taskName: UITextField!
    /*
     when user completes task creation add it to task list
     */
    @IBAction func onDone(_ sender: Any) {
        let newTask = task()
        newTask.name = taskName.text ?? ""
        newTask.breakDur = Int(breakTime.countDownDuration)
        newTask.workDur = Int(workTime.countDownDuration)
        newTask.icon = taskIcon.image
        
        delegate?.retrieveTask(task: newTask)
        
        self.dismiss(animated: true, completion: nil)
    }
    /*
     if cancel dismiss page
     */
    @IBAction func onCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

