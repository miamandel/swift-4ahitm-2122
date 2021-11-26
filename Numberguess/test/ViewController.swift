import UIKit

class ViewController: UIViewController {
    var model = Model()
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonGuess: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model.numberToGuess = Int(arc4random_uniform(100));
        label.text = "Try to guess the number!"
        
        print(model.numberToGuess)
    }
    
    @IBAction func onChangeTextField(_ sender: UITextField) {
        buttonGuess.isEnabled = model.isValid(guess: Int(textField.text!))
    }
    
    @IBAction func onclick(_ sender: UIButton) {
        let guess = Int(textField.text!)!
        model.adGuessedNumber(guess: guess)
    }
    
    func compare(guessedString: String) -> Int! {
        let guess = Int(guessedString)!
        return model.compare(guess: guess)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabelViewController = segue.destination as? TableViewController
        tabelViewController?.model = model
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(checkNumber()){
            return true
        }
        print("no")
        return false
    }
    
    func checkNumber() -> Bool {
        let compareResult = compare(guessedString: textField.text!)
        
        let text: String?
        
        switch compareResult{
        case -1:
            text = "Your number is to low"
            label.text = text
            return false
        case 1:
            text = "Your number is too high"
            label.text = text
            return false
        default:
            text = "Hurray! Thats the number!"
            label.text = text
            return true
        }
        return false
    }
}

