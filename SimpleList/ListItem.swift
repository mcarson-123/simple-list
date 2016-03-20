import UIKit

class ListItem: NSObject {
    var itemDescription: String
    let dateCreated: NSDate
    
    init(itemDescription: String) {
        self.itemDescription = itemDescription
        self.dateCreated = NSDate()
        
        super.init()
    }
}