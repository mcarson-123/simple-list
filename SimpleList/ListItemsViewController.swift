import UIKit

class ListItemsViewController: UITableViewController {
//    @IBOutlet var inputListItem: UITextField!
    
    var listItemsStore: ListItemStore!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        print("INPUT \(textField.text)")
        textField.resignFirstResponder()
        return true
    }
    
    // TODO: create multiple sections
    // 1 section for input
    // 1 section for the created list items
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TextInputCell") as! TextInputTableViewCell
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}