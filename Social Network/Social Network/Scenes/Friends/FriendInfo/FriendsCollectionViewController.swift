
import UIKit


class FriendsCollectionViewController: UICollectionViewController {
    //MARK: - Outlets
    @IBOutlet var friendsCollectionView: UICollectionView!
    //MARK: - Properties
    private var reuseID = "FriendsCollectionViewCell"
    var displayedFriend: Friend?
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = displayedFriend?.name
    }
    // MARK: - UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseID, for: indexPath) as? FriendsCollectionViewCell else {fatalError("Message: Error in dequeue FriendsCollectionViewCell")}
        cell.friendImage.image = displayedFriend?.avatar
    
        return cell
    }
}
