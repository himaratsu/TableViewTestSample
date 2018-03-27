import UIKit

class ViewController: UIViewController {
    
    let tableView = UITableView()
    var items = ["Hello", "World", "Swift 4", "Xcode 9.2", "iPhone X", "WWDC 2018"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        
        // TableViewを画面いっぱいに貼る
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2    // ヘッダー + コンテンツ
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.section == 0 {
            cell.textLabel?.text = "TableViewのテストのサンプルです"
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14.0)
            cell.textLabel?.textColor = .gray
            cell.textLabel?.textAlignment = .center
        } else {
            cell.textLabel?.text = items[indexPath.row]
        }
        return cell
    }
}



