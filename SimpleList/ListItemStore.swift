import UIKit

class ListItemStore {
    
    var allListItems = [ListItem]()
    
    func createListItem(text: String) -> ListItem {
        let newItem = ListItem(itemDescription: text)
        
        allListItems.append(newItem)
        
        return newItem
    }
}