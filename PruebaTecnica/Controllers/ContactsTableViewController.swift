//
//  ContactsTableViewController.swift
//  PruebaTecnica
//
//  Created by kjoe on 7/14/21.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    var service: RemoteDataService?

    var result: [ContacsResult]?
    override func viewDidLoad() {
        super.viewDidLoad()
        //showActivityIndicator()
        let dataLoader: DataLoader = NetworkLoader(session: URLSession.shared)
        service = RemoteDataService(loader: dataLoader)
        loadContacts()
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if result?.isEmpty ?? false{
            //TODO: - Manage empty state
        }else {
            //TODO: - restore from empty state when data is avaible
        }
        return result?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ContactsTableViewCell
        cell.contactId.text = result?[indexPath.row].id ?? ""
        cell.contactNo.text = result?[indexPath.row].contact_no ?? ""
        cell.lastname.text = result?[indexPath.row].lastname ?? ""
        cell.createdTime.text = DateHelper.getDate(date: result?[indexPath.row].createdtime ?? "")
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func loadContacts() {
        showActivityIndicator()
        let sessionName = KeychainService.loadPassword(service: "PTecnica", account: "session")
        let qItems = [URLQueryItem(name: "operation", value: "query"),URLQueryItem(name: "sessionName", value: sessionName),URLQueryItem(name: "query", value: "select * from Contacts;")]
        let contactsEndpoint = HomeEndpoint(method: .get, path: "/datacrm/pruebatecnica/webservice.php", queryItems: qItems, headers: nil, params: nil)
        _ = service?.getData(endPoint: contactsEndpoint, completion: { [weak self] (result: Result<ContacsResponse,Error>) in
            DispatchQueue.main.async {
                guard let self = self else {return}
                self.hideActivityIndicator()
                switch result {
                case .success(let data):
                    self.result = data.result
                    self.tableView.reloadData()
                case .failure(let error):
                    debugPrint("error:",error.localizedDescription)
                }
            }
        })
    }

}
