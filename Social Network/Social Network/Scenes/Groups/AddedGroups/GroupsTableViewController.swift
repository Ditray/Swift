
import UIKit

class GroupsTableViewController: UIViewController, UITableViewDataSource {
    
    //MARK: - Outlets
    @IBOutlet var groupTableView: UITableView!
    // Добавление группы
    @IBAction func goBackFromAvaliableGroupsScreen (with segue: UIStoryboardSegue){
        guard let avaliableVC = segue.source as? AvaliableGroupsTableViewController,
              let indexPath = avaliableVC.tableView.indexPathForSelectedRow else { return }
        
        let newGroup = avaliableVC.avaliableGroups[indexPath.row]
        
        guard !groups.contains(where: {group -> Bool in group.name == newGroup.name}) else {
            return
        }
        groups.append(newGroup)
        groupTableView.reloadData()
    }
    //MARK: - Properties
    private var reuseID = "GroupsTableViewCell"
    
    private var groups = [
        Group(name: "Group#1", subscribers: 43, image: UIImage(named: "Image")),
        Group(name: "Group#2", subscribers: 5254, image: UIImage(named: "Image")),
        Group(name: "Group#3", subscribers: 345, image: UIImage(named: "Image")),
        Group(name: "Group#4", subscribers: 123745, image: UIImage(named: "Image")),
        Group(name: "Group#5", subscribers: 34554, image: nil),
        Group(name: "Group#6", subscribers: 3453455, image: nil)
    ]
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? GroupsTableViewCell else {fatalError("Message: Error in dequeue FriendsTableViewCell")}
        cell.groupImage.image = groups[indexPath.row].image
        cell.groupName.text = groups[indexPath.row].name
        return cell
    }
}
// Удаление группы
extension GroupsTableViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            let deletedGroup = groups[indexPath.row]
            groups.remove(at: indexPath.row)
            print(deletedGroup.name)
            groupTableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            return
        }
    }
}
