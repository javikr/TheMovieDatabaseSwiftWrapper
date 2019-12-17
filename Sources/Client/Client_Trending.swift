import Foundation

extension Client{

  static func trending(baseURL: String, page: Int, completion: @escaping (ClientReturn) -> ()) -> (){

    let url = "https://api.themoviedb.org/3/trending/" + baseURL
    networkRequest(url: url, parameters: ["page": String(page) as AnyObject]){
      apiReturn in
      if(apiReturn.error == nil){
        completion(apiReturn)
      }
    }
  }

}

