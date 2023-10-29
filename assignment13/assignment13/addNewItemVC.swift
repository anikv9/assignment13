

import Foundation

import UIKit

protocol AddItemDelegate: AnyObject {
    func addItemToList(_ item: Item)
    
    
}

struct Item {
    var name: String
    var image: UIImage?
}

class AddNewItemToListVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let nameTextField = UITextField()
    let imageView = UIImageView()
    let addButton = UIButton()
    
    weak var delegate: AddItemDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add New Item"
        
        nameTextField.placeholder = "Enter item name"
        nameTextField.borderStyle = .roundedRect
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        
        addButton.setTitle("Add Item", for: .normal)
        addButton.backgroundColor = .systemBlue
        addButton.setTitleColor(.white, for: .normal)
        addButton.layer.cornerRadius = 10
        addButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addButton)
        addButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addButton.addTarget(self, action: #selector(saveItemTapped), for: .touchUpInside)
    }
        
        
        @objc func saveItemTapped() {
            guard let name = nameTextField.text else { return }
            let image = imageView.image
            let newItem = Item(name: name, image: image)
            delegate?.addItemToList(newItem)
            navigationController?.popViewController(animated: true)
        }
        
        
    
    
}
