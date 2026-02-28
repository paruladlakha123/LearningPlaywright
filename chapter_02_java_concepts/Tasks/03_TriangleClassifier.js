let a = 10, b = 10, c = 10;

if(a == b && b == c){
console.log("equilateral traingle");
}else if(a === b || b === c || a === c){
    console.log("isoscles traingle");
}else if(a !== b && b !== c && a !== c ){
    console.log("scalene traingle");
}else{
    console.log("not a triangle");
}