
import UIKit


class FriendsCollectionViewController: UICollectionViewController {
    //MARK: - Outlets
    @IBOutlet var friendsCollectionView: UICollectionView!
    
    private var reuseID = "FriendsCollectionViewCell"
    var displayedFriend: Friend?

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
    
        return cell
    }
}
