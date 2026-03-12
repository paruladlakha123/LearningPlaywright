//Array literal

let arr = ["10", "20", "30", "40"]; // this is called array literal
console.log(arr.length); // length is a property not function in both js and java 
console.log(arr[0]);
console.log(arr[4]); // O/P will display undefined and not indexoutofbound error unlike java

//Array constructor

let scores = new Array(3); // it will just create 3 spaces in memory
console.log(scores);

let scores2 = new Array(10, 20, 30);
console.log(scores2);
console.log(scores2[0]);

//Array with Array.of function

let test = Array.of(100, 200, 300); //of function does same work as above
console.log(test[1]);

//Array with Array.from() function

let test2 = Array.from("hello"); //("h", "e", "l", "l", "o")