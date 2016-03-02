import UIKit
import GaugeKit

class FirstViewController: UIViewController {
    //test
    @IBOutlet var proGauge: Gauge!
    @IBOutlet weak var proLabel: UILabel!
    @IBOutlet weak var fatGauge: Gauge!
    @IBOutlet weak var fatLabel: UILabel!
    @IBOutlet weak var carbGauge: Gauge!
    @IBOutlet weak var carbLabel: UILabel!
    @IBOutlet weak var calGauge: Gauge!
    @IBOutlet weak var calLabel: UILabel!
    @IBOutlet weak var calOverflowLabel: Gauge!
    @IBOutlet weak var proOverflowGauge: Gauge!
    @IBOutlet weak var carbOverflowGauge: Gauge!
    @IBOutlet weak var fatOverflowGauge: Gauge!
    
    
    let person = (cal: "2000", fat: "50", carb: "250", pro: "150")
    
    let Eatenfooditems = [
        (name: "Breakfast", cal: "590", fat: "10", carb: "85", pro: "40", serving: "1", servingSize: "Scoop"),
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
        var EatenFat: Double = 0
        var EatenCarb: Double = 0
        var EatenPro: Double = 0
        var EatenCal: Double = 0
        
        
        for task in taskMgr.tasks {
            EatenFat = EatenFat + Double(task.fat)!
            EatenCarb = EatenCarb + Double(task.carbs)!
            EatenPro = EatenPro + Double(task.pro)!
            EatenCal = EatenCal + Double(task.cals)!
        }
        
        
        let fatLeft: Double = Double(person.fat)! - EatenFat
        let proLeft: Double = Double(person.pro)! - EatenPro
        let carbLeft: Double = Double(person.carb)! - EatenCarb
        let calLeft: Double = Double(person.cal)! - EatenCal
        
        let fatPercent: Int = Int((EatenFat / Double(person.fat)!)*100)
        let proPercent: Int = Int((EatenPro / Double(person.pro)!)*100)
        let carbPercent: Int = Int((EatenCarb / Double(person.carb)!)*100)
        let calPercent: Int = Int((EatenCal / Double(person.cal)!)*100)
        
        // Setting Label Values
        fatLabel.text = String(Int(fatLeft)) + "g"
        proLabel.text = String(Int(proLeft)) + "g"
        carbLabel.text = String(Int(carbLeft)) + "g"
        calLabel.text = String(Int(calLeft)) + "kcal"
        // Setting Label Values
        
        // Setting Gauge Values
        fatGauge.rate = CGFloat(fatPercent)
        carbGauge.rate = CGFloat(carbPercent)
        proGauge.rate = CGFloat(proPercent)
        calGauge.rate = CGFloat(calPercent)
        }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        
        var EatenFat: Double = 0
        var EatenCarb: Double = 0
        var EatenPro: Double = 0
        var EatenCal: Double = 0
        var remainingCals: Int = 0
        var remainingFat: Int = 0
        var remainingPro: Int = 0
        var remainingCarbs: Int = 0

        
        for task in taskMgr.tasks {
            EatenFat = EatenFat + Double(task.fat)!
            EatenCarb = EatenCarb + Double(task.carbs)!
            EatenPro = EatenPro + Double(task.pro)!
            EatenCal = EatenCal + Double(task.cals)!
        }
        
        
        let fatLeft: Double = Double(person.fat)! - EatenFat
        let proLeft: Double = Double(person.pro)! - EatenPro
        let carbLeft: Double = Double(person.carb)! - EatenCarb
        let calLeft: Double = Double(person.cal)! - EatenCal
        
        let fatPercent: Int = Int((EatenFat / Double(person.fat)!)*100)
        let proPercent: Int = Int((EatenPro / Double(person.pro)!)*100)
        let carbPercent: Int = Int((EatenCarb / Double(person.carb)!)*100)
        let calPercent: Int = Int((EatenCal / Double(person.cal)!)*100)
        
        // Setting Label Values
        fatLabel.text = String(Int(fatLeft)) + "g"
        proLabel.text = String(Int(proLeft)) + "g"
        carbLabel.text = String(Int(carbLeft)) + "g"
        calLabel.text = String(Int(calLeft)) + "kcal"
        // Setting Label Values
        
        // Setting Gauge Values
        fatGauge.rate = CGFloat(fatPercent)
        carbGauge.rate = CGFloat(carbPercent)
        proGauge.rate = CGFloat(proPercent)
        calGauge.rate = CGFloat(calPercent)
        
        print(proPercent);
        
        
        // Overflow Calorie Gauge
        if (calPercent > 100) {
            remainingCals = calPercent - 100
            calOverflowLabel.hidden = false;
            calOverflowLabel.rate = CGFloat(remainingCals)
            calLabel.text = String("+" + String(Int(EatenCal) - Int(person.cal)!)+"Kcal")

        }
        else{
            calOverflowLabel.hidden = true;
        }
        // **************************************
    
        
        // Overflow Protein Gauge
        //print("viewWIllappear" + "Eaten Pro" + String(EatenPro) + "person pro:" + String(person.pro));
        if (proPercent > 100) {
            remainingPro = proPercent - 100
            proOverflowGauge.hidden = false;
            proOverflowGauge.rate = CGFloat(remainingPro)
            proLabel.text = String("+" + String(Int(EatenPro) - Int(person.pro)!)+"g")
        }
        else{
            proOverflowGauge.hidden = true;
        }
        // **************************************
        
        
        // Overflow Fat Gauge
        if (fatPercent > 100) {
            remainingFat = fatPercent - 100
            fatOverflowGauge.hidden = false;
            fatOverflowGauge.rate = CGFloat(remainingFat)
            fatLabel.text = String("+" + String(Int(EatenFat) - Int(person.fat)!)+"g")
        }
        else{
            fatOverflowGauge.hidden = true;
        }
        // **************************************
        
        
        // Overflow Carb Gauge
        if (carbPercent > 100) {
            remainingCarbs = carbPercent - 100
            carbOverflowGauge.hidden = false;
            carbOverflowGauge.rate = CGFloat(remainingCarbs)
            carbLabel.text = String("+" + String(Int(EatenCarb) - Int(person.carb)!)+"g")
        }
        else{
            carbOverflowGauge.hidden = true;
        }
        // **************************************

    
    }

}

