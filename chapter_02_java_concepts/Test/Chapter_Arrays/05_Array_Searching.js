let result = ["pass", "pass", "fail","error"];
console.log(result.indexOf("fails")); 
// indexOf returns index of first matching item or -1 if not found

console.log(result.lastIndexOf("pass")); // searches from the end or -1 if not found
console.log(result.includes("skip")); // check if element present or not

let check = ["10","20", "30", "40"];
console.log(check.find(n => n > 20)); // find() method returns first matching number

console.log(check.findIndex(n => n > 20)); //finIndex returns index of first matching number

console.log(check.findLast(n => n > 20));

console.log(check.findLastIndex(n => n >20));
