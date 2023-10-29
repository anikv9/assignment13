
import Foundation

import UIKit

class ItemDetailsViewController: UIViewController {
    let itemImageView = UIImageView()
    let itemTitleLabel = UILabel()

    var item: Item?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Item Details"

        view.addSubview(itemImageView)
        let itemImageView = UIImageView()
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemImageView)

        itemImageView.contentMode = .scaleAspectFit
        itemImageView.backgroundColor = .clear
        itemImageView.clipsToBounds = true

        itemImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        itemImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        itemImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        itemImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        //ak ver mivxvdi ertianad rogor shevinaxo es constants da kvelgan gamovikeno
        
        
        
        view.addSubview(itemTitleLabel)
        let itemTitleLabel = UILabel()
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemTitleLabel)

    
        itemTitleLabel.text = "Item Title"
        itemTitleLabel.font = UIFont.systemFont(ofSize: 20)
        itemTitleLabel.textAlignment = .center

        itemTitleLabel.topAnchor.constraint(equalTo: itemImageView.bottomAnchor, constant: 20).isActive = true
        itemTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        itemTitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
    }
}

