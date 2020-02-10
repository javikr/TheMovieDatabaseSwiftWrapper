import Foundation

extension Client{

  static func trending(language: String, baseURL: String, page: Int, completion: @escaping (ClientReturn) -> ()) -> (){

    let url = "https://api.themoviedb.org/3/trending/" + baseURL
    
    var parameters: [String : AnyObject] = [:]
    parameters["language"] = language as AnyObject
    parameters["page"] = String(page) as AnyObject
    
    networkRequest(url: url, parameters: parameters){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn)
      }
    }
  }

}

