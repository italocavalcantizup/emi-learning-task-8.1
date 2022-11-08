//
//  PurchaseSettingsViewController.swift
//  LearningTask-8.1
//
//  Created by Italo cavalcanti on 08/11/22.
//

import UIKit

class PurchaseSettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieSession: Session!
    
    var menuItens: [MenuItem] = MenuItem.allCases
    var itemActiveIndex: Int = 0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupViews()
    }
    
    func setupViews() {
        tableView.tableHeaderView = PurchaseSettingsTableHeaderView.build(from: movieSession)
    }

}

extension PurchaseSettingsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PurchaseSettingsMenuItemCell") as? PurchaseSettingsMenuItemCell else {
            fatalError("Não foi possível obter célula para a lista")
        }
        cell.menuItem = menuItens[indexPath.row]
        cell.active = indexPath.row == itemActiveIndex
        return cell
    }
}

extension PurchaseSettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemActiveIndex = indexPath.row
    }
}
