//
//  ViewController.swift
//  Assingment
//
//  Created by Sushil on 20/02/23.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    var randomDogModal:RandomDogModal?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        let urlreq = URLRequest(url: URL(string:"https://dog.ceo/api/breeds/image/random")!)

        Networking.getResponseforRequest(urlReq: urlreq, completion: { [self] data in
                                    randomDogModal = try? JSONDecoder().decode(RandomDogModal.self, from: data)
            DispatchQueue.main.async {
                self.imgView.downloaded(from: URL(string: (randomDogModal?.imgurl ?? ""))!)
            }
            
            
                                 //   print(String(data: data, encoding: .utf8))
        })
        // Do any additional setup after loading the view.
    }

    @IBAction func savedog(_ sender: Any) {
     openDatabse()
        
       
    }
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext!
    
    func openDatabse()
        {
            context = appDelegate.persistentContainer.viewContext
            let entity = NSEntityDescription.entity(forEntityName: "FavouriteDogs", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            saveData(UserDBObj:newUser)
        }

        func saveData(UserDBObj:NSManagedObject)
        {
        
            UserDBObj.setValue( self.imgView.image?.pngData(), forKey: "dogimage")

            print("Storing Data..")
            do {
                try context.save()
            } catch {
                print("Storing data Failed")
            }

            
        }
    
    func fetchData()
       {
           context = appDelegate.persistentContainer.viewContext
           print("Fetching Data..")
           let request = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouriteDogs")
           request.returnsObjectsAsFaults = false
           do {
               let result = try context.fetch(request)
               for data in result as! [NSManagedObject] {
                   let image = data.value(forKey: "dogimage") as! Data
                                }
           } catch {
               print("Fetching data Failed")
           }
       }
   
    @IBAction func checkedsaveddog(_ sender: Any) {
        
    
    }
    
}



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
