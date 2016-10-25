//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    private init() {}
    
    var repositories: [GithubRepository] = []
    
    func getRepositoriesFromAPI(completion: @escaping ()->()) {
        repositories.removeAll()
        
        GithubAPIClient.getRepositories { (repos) in
            for repo in repos {
                self.repositories.append(GithubRepository(dictionary: repo))
            }
            completion()
        }
    }
}
