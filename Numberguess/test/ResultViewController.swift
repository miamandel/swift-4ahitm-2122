

import UIKit

class ResultViewController: UIViewController {

    var model:Model!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        result.text = "Du hast " + String(model.counterOfTrys) + " Versuche gebraucht."
    }


}
