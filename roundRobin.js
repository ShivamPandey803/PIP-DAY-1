// Initializing three arrays
const arr1 = [];
const arr2 = [];
const arr3 = [];
// Initializing a counter to keep track of the array in which the element will be pushed
let c = 1;
// Defining a function to allocate an element to an array
function allocateElement(element) {
  if (c === 1) {
    arr1.push(element);
    c = 2;
  } else if (c === 2) {
    arr2.push(element);
    c = 3;
  } else if (c === 3) {
    arr3.push(element);
    c = 1;
  }
}
// Allocating elements to the arrays using the round-robin method
allocateElement('A'); // In arr1
allocateElement('B'); // In arr2
allocateElement('C'); // In arr3
allocateElement('D'); // In arr1
allocateElement('E'); // In arr2
allocateElement('F'); // In arr3
// Output the arrays to the console to verify the results
console.log(arr1); // [ 'A', 'D' ]
console.log(arr2); // [ 'B', 'E' ]
console.log(arr3); // [ 'C', 'F' ]