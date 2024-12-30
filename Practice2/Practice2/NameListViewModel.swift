//
//  NameListViewModel.swift
//  Practice2
//
//  Created by Chichek on 27.12.24.
//

import Foundation

class NameListViewModel {
    
   enum NameListViewState {
        case success
        case fail
        case loading
        case loaded
    }
    
    private(set) var names: [WelcomeElement] = []
    var nameListCallBack : ((NameListViewState)-> Void)?
    private var baseUrl = "https://jsonplaceholder.typicode.com/users"
    
    func getNames() {
        var request = URLRequest(url: URL(string: baseUrl)!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error {
                print(error.localizedDescription)
                self.nameListCallBack?(.fail)
            } else if let data {
                self.nameListCallBack?(.loading)
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.nameListCallBack?(.loaded)
                    self.nameListCallBack?(.success)
                }
                do {
                    let names = try JSONDecoder().decode([WelcomeElement].self, from: data)
                    self.names = names
                } catch {
                    DispatchQueue.main.async {
                        self.nameListCallBack?(.fail)
                    }
                }
            }
        }.resume()
    }
}
