//let's start by making the source model class
// it will be easier to parse the Json

class Source {
  String id;
  String name;

  // let's create the constructor
  Source({this.id,this.name});

  // let's create the factory function to map the json
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json['id'], name: json['name']);
  }
}
