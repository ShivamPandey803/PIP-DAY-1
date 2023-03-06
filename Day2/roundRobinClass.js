class DynamicArray {
    constructor(numArrays) {
      this.arrays = [];
      for (let i = 0; i < numArrays; i++) {
        this.arrays.push([]);
      }
      this.currentArrayIndex = 0;
    }
    addElement(element) {
      this.arrays[this.currentArrayIndex].push(element);
      this.currentArrayIndex = (this.currentArrayIndex + 1) % this.arrays.length;
    }
    getArrays() {
      return this.arrays;
    }
  }
  // Usage
  const dynamicArray = new DynamicArray(3);
  dynamicArray.addElement('A');
  dynamicArray.addElement('B');
  dynamicArray.addElement('C');
  dynamicArray.addElement('D');
  dynamicArray.addElement('E');
  dynamicArray.addElement('F');
  dynamicArray.addElement('G');

  console.log(dynamicArray.getArrays());