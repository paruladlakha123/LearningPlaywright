let statuses = [200, 400, 500]; 
console.log(statuses.at(-1)); // in case of index [] square , in case of at() normal
console.log(statuses.at(-4)); // O/P will be undefined

// Modify in array

statuses[1] = "blocked";
console.log(statuses);
console.log(statuses.length);