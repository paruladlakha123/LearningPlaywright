let num = [2, 3, 4, 5];
console.log(num.push(6)); //length after added array
console.log(num);

num.push(7,8); // push will ADD at the end
console.log(num);

num.pop(); //pop will REMOVE from the end
console.log(num); 

console.log("---------next concept of unshift and shift");

let x = [7, 8, 9];
x.unshift(6); // ADD in beginning
console.log(x);

x.shift();
console.log(x); // REMOVE from beginning

console.log("--------- next concept of splice");

let y = [0, 1, 2, 3, 4, 5];
y.splice(2, 1); //removes 1 item at index 2
console.log(y);

y.splice(2, 0, 9);
console.log(y);

y.splice (2, 2, 8, 8);
console.log(y);
