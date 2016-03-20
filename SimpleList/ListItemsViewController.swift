import UIKit

class ListItemsViewController: UITableViewController {
//    @IBOutlet var inputListItem: UITextField!
    
    var listItemsStore: ListItemStore!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("INPUT \(textField.text)")
        textField.resignFirstResponder()
        return true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TextInputCell") as! TextInputTableViewCell
        
        return cell
    }
}