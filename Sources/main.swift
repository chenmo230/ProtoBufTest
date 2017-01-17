
import SwiftProtobuf
import Foundation

func getLibrary() -> MyLibrary {
    let map = ["route": "66"]
    
    var bookInfo = BookInfo()
    bookInfo.id = 10
    bookInfo.title = "Welcome to Swift"
    bookInfo.author = "Apple Inc2222."
    bookInfo.desc = "a book in introduce swift, very Good book!"
    bookInfo.totalPage = 1024
    bookInfo.publishers = "TuRing publish"
    
    var bookInfo2 = BookInfo()
    bookInfo2.id = 20
    bookInfo2.title = "ProtoBuf In Swift"
    bookInfo2.author = "Apple Inc222."
    bookInfo2.desc = "a book in introduce ProtoBuf in swift, very Good book!"
    bookInfo2.totalPage = 2024
    bookInfo2.publishers = "xxx publish"
    
    var bookInfo3 = BookInfo()
    bookInfo3.id = 30
    bookInfo3.title = "Perfect"
    bookInfo3.author = "PerfectSoft Inc."
    bookInfo3.desc = "a book in introduce PerfectSoft in swift, very Good book!"
    bookInfo3.totalPage = 3024
    bookInfo3.publishers = "TuRing publish"
    
    var bookInfo4 = BookInfo()
    bookInfo4.id = 40
    bookInfo4.title = "Go"
    bookInfo4.author = "Google Inc."
    bookInfo4.desc = "a book in introduce PerfectSoft in Google, very Good book!"
    bookInfo4.totalPage = 4024
    bookInfo4.publishers = "TuRing publish"
    
    var bookInfo5 = BookInfo()
    bookInfo5.id = 50
    bookInfo5.title = "React Native"
    bookInfo5.author = "FaceBook Inc."
    bookInfo5.desc = "a book in introduce React Native, very Good book!"
    bookInfo5.totalPage = 5024
    bookInfo5.publishers = "XXX publish"
    
    var bookInfo6 = BookInfo()
    bookInfo6.id = 60
    bookInfo6.title = "Java"
    bookInfo6.author = "Oracle Inc."
    bookInfo6.desc = "a book in introduce Java, very Good book!"
    bookInfo6.totalPage = 5024
    bookInfo6.publishers = "XXX publish"
    
    var bookInfo7 = BookInfo()
    bookInfo7.id = 40
    bookInfo7.title = "Go"
    bookInfo7.author = "Google Inc."
    bookInfo7.desc = "a book in introduce Java, very Good book!"
    bookInfo7.totalPage = 5024
    bookInfo7.publishers = "XXX publish"
    
    var bookInfo8 = BookInfo()
    bookInfo8.id = 50
    bookInfo8.title = "React Native"
    bookInfo8.author = "FaceBook Inc."
    bookInfo8.desc = "a book in introduce Java, very Good book!"
    bookInfo8.totalPage = 5024
    bookInfo8.publishers = "XXX publish"
    
    
    var bookInfo9 = BookInfo()
    bookInfo9.id = 60
    bookInfo9.title = "Java"
    bookInfo9.author = "Oracle Inc."
    bookInfo9.desc = "a book in introduce Java, very Good book!"
    bookInfo9.totalPage = 5024
    bookInfo9.publishers = "XXX publish"
    
    var bookInfo10 = BookInfo()
    bookInfo10.id = 40
    bookInfo10.title = "Go"
    bookInfo10.author = "Google Inc."
    bookInfo10.desc = "a book in introduce Java, very Good book!"
    bookInfo10.totalPage = 5024
    bookInfo10.publishers = "XXX publish"
    
    var bookInfo11 = BookInfo()
    bookInfo11.id = 50
    bookInfo11.title = "React Native"
    bookInfo11.author = "FaceBook Inc."
    bookInfo11.desc = "a book in introduce Java, very Good book!"
    bookInfo11.totalPage = 5024
    bookInfo11.publishers = "XXX publish"
    
    var bookInfo12 = BookInfo()
    bookInfo12.id = 60
    bookInfo12.title = "Java"
    bookInfo12.author = "Oracle Inc."
    bookInfo12.desc = "a book in introduce Java, very Good book!"
    bookInfo12.totalPage = 5024
    bookInfo12.publishers = "XXX publish"
    
    var library = MyLibrary()
    library.id = 20
    library.name = "Swift"
    library.keys = map
    library.books = [bookInfo, bookInfo2 , bookInfo3, bookInfo4, bookInfo5, bookInfo6, bookInfo7, bookInfo8, bookInfo9, bookInfo10, bookInfo11,bookInfo12 /**/]
    library.address = "567 Davis Drive Newmarket, Ontario, Canada"
    library.manager = "Mr Storm"
    library.opentime = "8:00 am"
    
    return library
}

// 创建一个 MyLibrary实例
var protoLibrary = getLibrary()
var data: Data = try! protoLibrary.serializeProtobuf()
var str: String = try! protoLibrary.serializeJSON()



// Protobuf二进制 -> Model
var startDate = Date()
var tmpLibrary: MyLibrary?
for _ in 1...200000 {
    tmpLibrary = try MyLibrary(protobuf: data)
}
var endDate = Date()
print(try! tmpLibrary?.serializeJSON() ?? "tmpLibrary has not Value")
print("ProtoBuf Data -> Model Time：\(endDate.timeIntervalSince(startDate))")



// String -> Model
startDate = Date()
for _ in 1...200000 {
    let jsonData = str.data(using: .utf8)
    let dict:[String: Any]! = try JSONSerialization.jsonObject(with: jsonData!, options: JSONSerialization.ReadingOptions.allowFragments) as? Dictionary<String, Any>
    
    tmpLibrary = MyLibrary()
    let idStr = dict["id"] as! String
    tmpLibrary?.id = Int64(idStr)!
    tmpLibrary?.name = dict["name"] as! String
    tmpLibrary?.keys = dict["keys"] as! Dictionary<String, String>
    tmpLibrary?.address = dict["address"] as! String
    tmpLibrary?.manager = dict["manager"] as! String
    tmpLibrary?.opentime = dict["opentime"] as! String
    
    
    var arr: [BookInfo] = [BookInfo]()
    for bookInfoDict in dict["books"] as! [[String: Any]] {
        var tmpBookInfo = BookInfo()
        let bookId = bookInfoDict["id"] as! String
        tmpBookInfo.id = Int64.init(bookId)!
        tmpBookInfo.title = bookInfoDict["title"] as! String
        tmpBookInfo.author = bookInfoDict["author"] as! String
        tmpBookInfo.desc = bookInfoDict["desc"] as! String
        tmpBookInfo.publishers = bookInfoDict["publishers"] as! String
        let totalPage = bookInfoDict["totalPage"] as! String
        tmpBookInfo.totalPage = Int64(totalPage)!
        
        arr.append(tmpBookInfo);
    }
    tmpLibrary?.books = arr
    
}
endDate = Date();
print(try! tmpLibrary?.serializeJSON() ?? "tmpLibrary has not Value")

print("JSONSerialization String -> Model Time：\(endDate.timeIntervalSince(startDate))")






