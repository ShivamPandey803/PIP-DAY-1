const numArrays = 4;
const arrays = [];

for (let i = 0; i<numArrays; i++)
{
    arrays.push([])
}


let currentArrayIndex = 0;

const elements = ['a','b','c','d','e','f',1,2,3,4,5,7,8,9,10,];

for (let i = 0; i< elements.length; i++){
    const currentArray = arrays[currentArrayIndex];
    currentArray.push(elements[i]);
    currentArrayIndex = (currentArrayIndex +1) % numArrays
}

// Printing the final contents of the arrays

for(let i = 0; i<arrays.length;i++){
    console.log(`Array ${i+1}:${arrays[i]}`);


}
console.log(arrays)

// output of the program
// Array 1:a,1,8
// Array 2:b,2,9
// Array 3:c,3,10
// Array 4:d,4
// Array 5:e,5
// Array 6:f,7

