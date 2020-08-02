//
//  MVVMSampleViewController.swift
//  AllSwiftSamples
//
//  Created by DEFTeam on 31/07/20.
//  Copyright © 2020 XYZ. All rights reserved.
//

import UIKit

class MVVMSampleViewController: UIViewController {

    var tableView = UITableView()
    var data = [MVVMBreachModel]()
    var breachesViewModel = MVVMBreachViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        breachesViewModel.fetchBreaches { [weak self] _ in
            DispatchQueue.main.async {
                self?.updateUI()
            }
        }
    }

    func updateUI() {
        tableView.reloadData()
    }

}

extension MVVMSampleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breachesViewModel.breaches.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cellData = breachesViewModel.breaches[indexPath.row]
        cell.textLabel?.text = cellData.title
        return cell
    }
}

extension MVVMSampleViewController: UITableViewDelegate {
}
