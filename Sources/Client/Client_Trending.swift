import Foundation

extension Client{

  static func trending(baseURL: String, page: Int, language: String?, region: String?, completion: @escaping (ClientReturn) -> ()) -> (){

    let url = "https://api.themoviedb.org/3/trending/" + baseURL
    
    var parameters: [String : AnyObject] = [:]
    
    parameters["page"] = page as AnyObject?

    if(language != nil){
      parameters["language"] = language as AnyObject?
    }
    
    networkRequest(url: url, parameters: parameters){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn)
      }
    }
  }

}

