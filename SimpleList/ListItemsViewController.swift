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
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numRows = listItemsStore.allListItems.count + 1 // +1 for the input text element
        return numRows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return tableView.dequeueReusableCellWithIdentifier("textInputCell") as! TextInputTableViewCell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("listItemCell") as! ListItemTableViewCell
            
            let listItem = listItemsStore.allListItems[indexPath.row - 1] // -1 for first input text element
            
            let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: listItem.itemDescription)
            
            if listItem.completed == true {
                cell.textLabel?.textColor = UIColor.lightGrayColor()
                cell.tintColor = UIColor.lightGrayColor()
                
                attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
                
            } else { // Item not completed
                cell.textLabel?.textColor = UIColor.blackColor()
                
                attributeString.removeAttribute(NSStrikethroughStyleAttributeName, range: NSMakeRange(0, attributeString.length))
                
            }
            
            cell.textLabel?.attributedText = attributeString
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            return // Don't edit the input text field
        }

        let cell = tableView.cellForRowAtIndexPath(indexPath) as! ListItemTableViewCell
        let listItem = listItemsStore.allListItems[indexPath.row - 1]
        let attributedText = cell.textLabel?.attributedText as! NSMutableAttributedString
        
        // Toggle strikethrough and completed attribute
        if listItem.completed == true {
            listItem.completed = false
            cell.textLabel?.textColor = UIColor.blackColor()
            
            attributedText.removeAttribute(NSStrikethroughStyleAttributeName, range: NSMakeRange(0, attributedText.length))
        } else {
            listItem.completed = true
            cell.textLabel?.textColor = UIColor.lightGrayColor()
            cell.tintColor = UIColor.lightGrayColor()
            
            attributedText.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributedText.length))
            
        }
        
        cell.textLabel?.attributedText = attributedText
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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