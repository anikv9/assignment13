import UIKit

class ViewController: UIViewController, AddItemDelegate {
    
    
    func addItemToList(_ item: Item) {
        items.append(item)
            tableView.reloadData()
    }
    
   //ak gavchedeee
    
    
    private var tableView: UITableView!
    var items: [Item] = []
    
    struct Item {
        var name: String
        var image: UIImage?
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        title = "Favorites"
        view.addSubview(tableView)
        setTableViewConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    private func setupTableView() {
        initTableView()
        setTableViewConstraints()
        registerTableViewCells()
    }
    
    private func initTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func registerTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @objc func addButtonTapped() {
        let addNewItemVC = AddNewItemToListVC()
            present(addNewItemVC, animated: true, completion: nil)    }
}

