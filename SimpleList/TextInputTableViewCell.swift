import UIKit

public class TextInputTableViewCell: UITableViewCell {
    
    @IBOutlet var inputListItem: UITextField!
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("INPUT 2")
        textField.resignFirstResponder()
        return true
    }
}