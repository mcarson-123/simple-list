import UIKit

class ListItemStore {
    
    var allListItems = [ListItem]()
    
    func createListItem() -> ListItem {
        let newItem = ListItem(itemDescription: "Pet your cat")
        
        allListItems.append(newItem)
        
        return newItem
    }
}