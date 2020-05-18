extension WhereLimit on List{
  
  List<T> whereLimit<T>(bool check(T value),{int limit=10}){
    List<T> tempList =List<T>();
    
    for (var element in this) {
        
        if(check(element)){
          tempList.add(element);
        }
        if(tempList.length==limit) break;
    }
    
    return tempList;
  }
}