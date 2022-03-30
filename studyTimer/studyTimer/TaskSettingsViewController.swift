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
    var workDur = 0
}

protocol TaskSettingsViewControllerDelegate: AnyObject {
    func retrieveTask(task:task)
    
}

class TaskSettingsViewController: UIViewController {

    weak var delegate: TaskSettingsViewControllerDelegate?
    
    @IBOutlet weak var workTime: UIDatePicker!
    @IBOutlet weak var taskName: UITextField!
    /*
     when user completes task creation add it to task list
     */
    @IBAction func onDone(_ sender: Any) {
        let newTask = task()
        newTask.name = taskName.text ?? ""
        newTask.workDur = Int(workTime.countDownDuration)
        
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

