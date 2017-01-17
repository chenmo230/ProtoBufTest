# ProtoBufPerformanceTest
This project is to test protobuf vs json performance in swift!
这是一个Swift测试protobuf vs  json性能的例子!
# Usage(用法)
in project path
```
$ swift build
$ ./.build/debug/ProtoBufDemo5
```
# consequence(结果)
maybe like this:
```
{"id":"20","name":"Swift","books":[{"id":"10","title":"Welcome to Swift","author":"Apple Inc2222."},{"id":"20","title":"ProtoBuf In Swift","author":"Apple Inc222."},{"id":"30","title":"Perfect","author":"PerfectSoft Inc."},{"id":"40","title":"Go","author":"Google Inc."},{"id":"50","title":"React Native","author":"FaceBook Inc."},{"id":"60","title":"Java","author":"Oracle Inc."},{"id":"40","title":"Go","author":"Google Inc."},{"id":"50","title":"React Native","author":"FaceBook Inc."},{"id":"60","title":"Java","author":"Oracle Inc."},{"id":"40","title":"Go","author":"Google Inc."},{"id":"50","title":"React Native","author":"FaceBook Inc."},{"id":"60","title":"Java","author":"Oracle Inc."}],"keys":{"route":"66"}}
ProtoBuf Data -> Model Time：42.8047310113907
{"id":"20","name":"Swift","books":[{"id":"10","title":"Welcome to Swift","author":"Apple Inc2222."},{"id":"20","title":"ProtoBuf In Swift","author":"Apple Inc222."},{"id":"30","title":"Perfect","author":"PerfectSoft Inc."},{"id":"40","title":"Go","author":"Google Inc."},{"id":"50","title":"React Native","author":"FaceBook Inc."},{"id":"60","title":"Java","author":"Oracle Inc."},{"id":"40","title":"Go","author":"Google Inc."},{"id":"50","title":"React Native","author":"FaceBook Inc."},{"id":"60","title":"Java","author":"Oracle Inc."},{"id":"40","title":"Go","author":"Google Inc."},{"id":"50","title":"React Native","author":"FaceBook Inc."},{"id":"60","title":"Java","author":"Oracle Inc."}],"keys":{"route":"66"}}
JSONSerialization String -> Model Time：47.3118770122528
```
