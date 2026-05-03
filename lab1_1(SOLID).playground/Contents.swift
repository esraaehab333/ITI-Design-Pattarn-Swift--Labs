class Handler{
    // this naming is handler
    // Single Resbonsibility
    // as it handle the both (api and db)
    func handle(){
        let data = requestDataToAPI()// <- this is handle the request from api
        let array = parse(data:data)//<- here pase data to save
        saveToDB(array:array) // <- here make the other job save on db
    }
    private func requestDataToApi()->Data{
        return data
    }
    private func parse(data:Data)->[String]{
        return str
    }
    private func saveToDaB(array:[String]){
        //saving on db
    }
}
////////////////////////////////solution///////////////////////////////////////////
// we can make a protocal with name APIHandler and other for DataBaseHandler or manger
protocol APIManager{
    // the request handler function
    func requestData()->Data
}
// other protocal for the db
protocol DBManager{
    func save(array:[String])
}
// other for parsing data like the models in android
protocol DataParserManager{
    func parse(data:Data)->[String]
}
// what happend in the handler ??
class Handler{
    // take referance from the protocals to use it
    private let apiManager :APIManager
    private let dbManager : DBManager
    private let parseManager :DataParserManager
    func handle(){
        let data = apiManager.requestData()
        let array = parseManager.parse(data: data)
        dbManager.save(array: array)
    }
}
