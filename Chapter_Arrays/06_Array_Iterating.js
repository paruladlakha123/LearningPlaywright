let test = ["login","checkout","search"];

for(i=0; i<test.length; i++){     // for loop
console.log(test[i]);  
}


for (let test1 of test){       //for...of 
    console.log(test1);
}

test.forEach((test2, index) => {
console.log(`${index} : ${test2}`);
});

for(test3 in test ){
    console.log(test3 + test[test3]); //for...of gives value and for...in gives you index
}

// for in using template literal
// for(test3 in test){
//     console.log(`${test3} : ${test[test3]} `)
// }
