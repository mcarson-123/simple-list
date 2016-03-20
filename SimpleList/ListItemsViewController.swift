import UIKit

class ListItemsViewController: UITableViewController {
    
    var listItemsStore: ListItemStore!
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if let text = textField.text {
            listItemsStore.createListItem(text)
            
            textField.text = ""
            tableView.reloadData()
        }
        
        textField.resignFirstResponder()
        return true
    }
    
    // TODO: create multiple sections ?
    // 1 section for input
    // 1 section for the created list items
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: for list section, change to number of list items
        let numRows = listItemsStore.allListItems.count + 1 // +1 for the input text element
        return numRows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return tableView.dequeueReusableCellWithIdentifier("textInputCell") as! TextInputTableViewCell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("listItemCell") as! ListItemTableViewCell
            
            let listItem = listItemsStore.allListItems[indexPath.row - 1] // -1 for first input text element
            cell.textLabel?.text = listItem.itemDescription
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.row == 0 {
            return false
        } else {
            return true
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let listItem = listItemsStore.allListItems[indexPath.row - 1] // -1 for input text field
            listItemsStore.deleteListItem(listItem)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}