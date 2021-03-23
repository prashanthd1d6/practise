//
//  MainTableViewController.swift
//  CollectionView
//
//  Created by Akula harish on 04/03/21.
//

import UIKit

class MainTableViewController: UITableViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var collectionView:UICollectionView!
    var gridView:UIView!
    var svc:ViewController!
    var allDetailsArrayL = [[String]]()
    var imgArrayTV=[UIImage]()
    
    
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    @IBAction func segmentAction(_ sender: Any) {
        
        if (segment.selectedSegmentIndex == 1){
                   gridView.isHidden = false
               }else{
                   gridView.isHidden = true
               }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .plain, target: self, action: #selector(addTapped))
        
        
        gridView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: tableView.frame.size.height))
        gridView.backgroundColor = .yellow
        tableView.addSubview(gridView)
        
        gridView.isHidden = true
                collection()
        
       let listNib = UINib(nibName: "MainTableViewCell", bundle: nil)
        tableView.register(listNib, forCellReuseIdentifier: "mcv")
        print(allDetailsArrayL.count)
    }
    @objc func addTapped(){
      
        let svc = storyboard?.instantiateViewController(identifier: "svc") as! ViewController
        svc.firstViewController = self
        navigationController?.pushViewController(svc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {

        tableView.reloadData()
        collectionView.reloadData()
   }
    
    
    func collection(){
         
            var flowLayoutObj = UICollectionViewFlowLayout()
            flowLayoutObj.itemSize = CGSize(width: 200, height: 300)
            flowLayoutObj.scrollDirection = .vertical
            flowLayoutObj.minimumLineSpacing = 10
            flowLayoutObj.minimumInteritemSpacing = 10
            
            
            collectionView = UICollectionView(frame: gridView.bounds, collectionViewLayout: flowLayoutObj)
        //collectionView.backgroundColor = .darkGray
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "mcvl")
            gridView.addSubview(collectionView)
            
        let cvCell = UINib(nibName: "MainCollectionViewCell", bundle: nil)
        collectionView.register(cvCell, forCellWithReuseIdentifier: "mcvl")
        }
        
    //cv delegates
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return allDetailsArrayL.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mcvl", for: indexPath) as! MainCollectionViewCell
         
            cell.layer.cornerRadius = 15
            cell.clipsToBounds = true

       
           // cell.collectionViewImage.image = imgArrayTV[indexPath.row]
            cell.collectionViewLabel.text = """
                FN : \(allDetailsArrayL[indexPath.row][0])
                LN : \(allDetailsArrayL[indexPath.row][1])
                Pro : \(allDetailsArrayL[indexPath.row][3])
                """
           // cell.sizeToFit()
            cell.collectionViewLabel.numberOfLines = 0
       
            return cell
        }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mc = MCTableViewController()
        
        mc.detailsArrayMC = allDetailsArrayL
        navigationController?.pushViewController(mc, animated: true)
    }
        
        
    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allDetailsArrayL.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mcv", for: indexPath) as! MainTableViewCell
        cell.FNLabel.text = "First Name:\(allDetailsArrayL[indexPath.row][0])"
        cell.LNLabel.text = "Last Name:\(allDetailsArrayL[indexPath.row][1])"
        cell.professionLabel.text = "Profession:\(allDetailsArrayL[indexPath.row][3])"
        //cell.cellImage.image = imgArrayTV[indexPath.row]

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 310
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mc = MCTableViewController()
       
        mc.detailsArrayMC = allDetailsArrayL
        navigationController?.pushViewController(mc, animated: true)
        //mc.imgArrayMC = imgArrayTV[indexPath.row]
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

}
