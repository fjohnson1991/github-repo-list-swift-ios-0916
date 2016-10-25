//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//




import UIKit

class GithubAPIClient {

    class func getRepositories(with completion: @escaping ([[String:AnyObject]])-> Void) {
        let url = URL(string: "https://api.github.com/repositories?client_id=ea6ef2456963244d79fd&client_secret=2409f794a4f9a83537159f85aab8507d18bc57d1")

        if let unwrappedURL = url {
            
            let session = URLSession.shared
            
            let task = session.dataTask(with: unwrappedURL, completionHandler: { (data, resonse, error) in
                
                do {
                    
                    if let unwrappedData = data {
                        var responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as! [[String: AnyObject]]
                    
                        completion(responseJSON)
                        print(responseJSON)
                    }
                    
                    
                    
                } catch {
                    
                    print(error)
                }
            })
            task.resume()
        }
    }
    
}
    


