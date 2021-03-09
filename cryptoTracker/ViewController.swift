//
//  ViewController.swift
//  cryptoTracker
//
//  Created by Karan Gandhi on 3/9/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Do any additional setup after loading the view.
    }


    
    let url = "https://min-api.cryptocompare.com/data/price?tsyms=USD&fsym="
    
    //FOUNDATION ->
    
    func getData(){
        
        //Step 1: //Initialize the URL
        guard let url = URL(string: url) else { return }
        
        
        
        // Step 2 : initialized task and url session
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            
      
            //Checking Optionals
            guard let data = data, error == nil else {return}
            
            print("Data Received!")
            
            
            do {
                
                let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                print(Result.USD)
                
            }
            
            catch {
                
                print(error.localizedDescription)
                
            }
            
            
            

            
        }
      //Step 3 : Task .Resume -> Initiate the process
        task.resume()
        
        
        
    }
    
    
    
    
    struct APIResponse : Codable {
        let USD : Float
    }
    
    
}

