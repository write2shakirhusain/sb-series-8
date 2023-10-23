//
//  ViewController.swift
//  DelegationDesignPatterDemo
//
//  Created by Shakir Husain on 25/09/23.
//

import UIKit

class ViewController: UIViewController,ServiceDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        var service = APIService()
        
        //Set delegate
        service.delegate = self
        
        //Inform to Service provider
        service.fetchProducts()
                
    }
    
    func didGetProducts(list: [String]) {
        print(list)
    }
    


}



protocol ServiceDelegate{
    func didGetProducts(list:[String])
}

class APIService{
    
    //Agreement
    var delegate:ServiceDelegate?
    
    //Inform me by this method
    func fetchProducts()  {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.handleRequest()
        }
        
    }
    
    func handleRequest() {
        if let del = delegate{
            
            // respond to service Gainer
            del.didGetProducts(list: ["P1","P2","P3"])
        }
    }
    
    
}
