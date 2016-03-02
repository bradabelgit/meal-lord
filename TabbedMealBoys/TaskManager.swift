
import UIKit

var taskMgr: TaskManager = TaskManager()

struct task{
    var name = "Un-Named"
    var cals = "Un-Described"
    var pro = "Un-Described"
    var carbs = "Un-Described"
    var fat = "Un-Described"
    var qty = "Un-Described"
    
}



class TaskManager: NSObject {
    
    var tasks = [task]()
    func addTask(name: String, cals: String, pro: String, carbs: String, fat: String, qty: String){
        tasks.append(task(name: name, cals: cals, pro: pro, carbs: carbs, fat: fat, qty: qty))
    }
}
