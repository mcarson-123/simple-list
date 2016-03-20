import UIKit

class ListItemStore {
    
    var allListItems = [ListItem]()
    
    func createListItem(text: String) -> ListItem {
        let newItem = ListItem(itemDescription: text)
        
        allListItems.append(newItem)
        
        return newItem
    }
    
    func deleteListItem(item: ListItem) {
        if let index = allListItems.indexOf(item) {
            allListItems.removeAtIndex(index)
        }
    }
}