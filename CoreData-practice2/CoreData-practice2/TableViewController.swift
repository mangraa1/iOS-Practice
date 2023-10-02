//
//  TableViewController.swift
//  CoreData-practice2
//
//  Created by mac on 02.10.2023.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    private let dataStoreManager = DataStoreManager()
    private var fetchResultController: NSFetchedResultsController<User>!

    override func viewDidLoad() {
        super.viewDidLoad()

        let fetchRequest = User.fetchRequest()
        fetchRequest.fetchLimit = 15

        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]

        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: dataStoreManager.viewContext, sectionNameKeyPath: nil, cacheName: nil)

        try! fetchResultController.performFetch()
    }

    //MARK: - @IBAction

    @IBAction func addAction(_ sender: Any) {

        let book = Book(context: dataStoreManager.viewContext)
        book.name = "Some book"

        let user = User(context: dataStoreManager.viewContext)
        user.name = "User \(Int.random(in: 0 ..< 100))"
        user.book = book

        dataStoreManager.saveContext()
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchResultController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = fetchResultController.sections?[section]

        return sectionInfo?.numberOfObjects ?? 0
    }


    //MARK: - Table view data source

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let user = fetchResultController.object(at: indexPath)

        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = user.book?.name

        return cell
    }
}
