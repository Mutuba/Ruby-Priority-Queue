function editDistance(str1, str2) {
  const memo = {};

  function dp(i, j) {
    if (memo[`${i}, ${j}`] !== undefined) {
      return memo[`${i}, ${j}`];
    }

    // check if either first or second are empty

    // if first is empty, insert all strings from second string
    if (i === 0) {
      return j;
    }

    // if second is empty, delete/remove all strings from first string
    if (j === 0) {
      return i;
    }

    if (str1[i] === str2[j]) {
      memo[`${i},${j}`] = dp(str1[i - 1], str2[j - 1]);
    } else {
      let insertion = dp(str1[i - 1], str2[j]);
      let deletion = dp(str1[i], str2[j - 1]);
      let substitution = dp(str1[i - 1], str2[j - 1]);

      memo[`${i}, ${j}`] = 1 + Math.min(insertion, deletion, substitution);
    }
    return memo[`${i}, ${j}`];
  }

  dp(str1.length, str2.length);
}

a = [1, 2, 3, 4];

function iterate(array) {
  for (let i = 0; i < array.length; i++) {
    console.log(array[i]);
  }
}

// iterate(a);

// reverse an array

myArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

function reverseArray(array) {
  let newArray = [];
  for (let i = array.length - 1; i >= 0; i--) {
    newArray.push(array[i]);
  }
  return newArray;
}

// console.log(reverseArray(myArray));

function reverseArray2(array) {
  let newArray = [];
  for (let i = 0; i < array.length; i++) {
    newArray.unshift(array[i]);
  }
  return newArray;
}

// console.log(reverseArray2(myArray));

// reverse a string option 3

function reverseString(string) {
  let arrayFromString = string.split("");
  let resultArray = [];
  for (let i = arrayFromString.length - 1; i >= 0; i--) {
    resultArray.push(arrayFromString[i]);
  }
  console.log(resultArray);
  return resultArray.join("");
}

console.log(reverseString("hello"));

// reverse a string using const i of

function reverseStringWithof(string) {
  let solutionArray = [];
  for (const char of string) {
    solutionArray.unshift(char);
  }
  return solutionArray.join("");
}

// factorial

function factorialRecursion(num) {
  if (num < 2) {
    return 1;
  }
  return num * factorial(num - 1);
}

// factorial Iterative

function factorialIterative(num) {
  if (num < 2) {
    return 1;
  }
  let result = 1;
  for (let i = 2; i <= num; i++) {
    result = result * i;
  }

  return result;
}

console.log("Mutuba", factorialIterative(3));

// fibonachi

function fibonachiIterative(num) {
  if (num < 2) {
    return num;
  }

  fib0, (fib1 = 0), 1;

  for (let i = 2; i <= num; i++) {
    fib0 = fib1;
    fib1 = fib0 + fib1;
  }
  return fib1;
}

// fibonachi Recursion

function fibbonachiRecursion(num) {
  if (num < 2) {
    return num;
  }
  return fibbonachiRecursion(num - 1) + fibbonachiRecursion(num - 2);
}

// fibonaachi Recursion with memoization

function fibonachiRecursionMemoization(num, memo) {
  if (num < 2) return num;
  memo = memo || {};
  if (memo[num]) return memo[num];
  return (memo[num] =
    fibonachiRecursionMemoization(num - 1, memo) +
    fibonachiRecursionMemoization(num - 2, memo));
}

console.log("fibonachiRecursionMemoization", fibonachiRecursionMemoization(10));

// prime number

function isPrime(number) {
  if (number < 2) {
    return false;
  }

  for (let i = 2; i <= Math.sqrt(number); i++) {
    if (number % i === 0) {
      return false;
    }
  }
  return true;
}

// power of two
function isPowerOfTwo(number) {
  if (number < 1) {
    return false;
  }
  while (number > 1) {
    if (number % 2 !== 0) {
      return false;
    }
    number = number / 2;
  }
  return true;
}

// power of two recursion
function isPowerOfTwoRecursion(number) {
  if (number < 1) {
    return false;
  }
  if (number === 1) {
    return true;
  }
  return isPowerOfTwoRecursion(number / 2);
}

let number = 55;

let numberToString = number.toString();

let newArrayString = "";
for (let i = 0; i < numberToString.length; i++) {
  console.log(numberToString[i]);
  newArrayString.concat(numberToString);
}
console.log("mum", newArrayString);

a = ["a", "b", "c", "d", "e", "f", "g", "h"];

// console.log("Mutuba testing arrays", a * 5);

class Node {
  constructor(data) {
    this.data = data;
    this.left = null;
    this.right = null;
  }
}

class BST {
  constructor() {
    this.root = null;
  }

  insert(data) {
    const newNode = new Node(data);

    if (this.root === null) {
      this.root = newNode;
    } else {
      this.insertNode(this.root, newNode);
    }
  }

  insertNode(node, newNode) {
    if (newNode.data < node.data) {
      if (node.left === null) {
        node.left = newNode;
      } else {
        this.insertNode(node.left, newNode);
      }
    } else {
      if (node.right === null) {
        node.right = newNode;
      } else {
        this.insertNode(node.right, newNode);
      }
    }
  }

  findMax(node = this.root) {
    if (node.right === null) {
      return node.data;
    } else {
      return this.findMax(node.right);
    }
  }
}

const bst = new BST();
bst.insert(15);
bst.insert(25);
bst.insert(10);
bst.insert(7);
bst.insert(22);
bst.insert(17);
bst.insert(13);
bst.insert(5);
bst.insert(9);
bst.insert(27);

console.log(bst.findMax()); // Output: 27

// Queue using an array

class Queue {
  constructor() {
    this.items = [];
  }

  enqueue(element) {
    this.items.push(element);
  }

  dequeue() {
    if (this.isEmpty()) {
      return "Underflow";
    }
    return this.items.shift();
  }

  front() {
    if (this.isEmpty()) {
      return "No elements in Queue";
    }
    return this.items[0];
  }

  isEmpty() {
    return this.items.length === 0;
  }

  printQueue() {
    return this.items.join(" ");
  }
}

const queue = new Queue();
queue.enqueue(10);
queue.enqueue(20);
queue.enqueue(30);
console.log(queue.printQueue()); // Output: 10 20 30
console.log(queue.front()); // Output: 10
queue.dequeue();
// console.log(queue.printQueue()); // Output: 20 30

// Stack using an array

class Stack {
  constructor() {
    this.items = [];
  }

  push(element) {
    this.items.push(element);
  }

  pop() {
    if (this.isEmpty()) {
      return "Underflow";
    }
    return this.items.pop();
  }

  peek() {
    if (this.isEmpty()) {
      return "No elements in Stack";
    }
    return this.items[this.items.length - 1];
  }

  isEmpty() {
    return this.items.length === 0;
  }

  printStack() {
    return this.items.join(" ");
  }
}

const stack = new Stack();
stack.push(10);
stack.push(20);
stack.push(30);
console.log(stack.printStack()); // Output: 10 20 30
console.log(stack.peek()); // Output: 30
stack.pop();
// console.log(stack.printStack()); // Output: 10 20

const x = Array(6)
  .fill()
  .map(() => Array(4).fill(0));

console.log("2 D array in javascript", x);

// edit distance with memoization

function editDistance(str1, str2) {
  let memo = {};
  // determine if i,j already in memo and return memo value
  // if first string is empty, insert characters of second string
  // if second is empty, remove(replace) all xters of first string
  function dp(i, j) {
    if (memo[`${i},${j}`] !== undefined) {
      return memo[`${i},${j}`];
    }
    if (i == 0) {
      return j;
    }
    if (j == 0) {
      return i;
    }
    // check if character at i matches character at j, and if so no operation
    // else perform delete, insert and replace operations
    if (str1[i - 1] == str2[j - 1]) {
      memo[`${i},${j}`] = dp(i - 1, j - 1);
    } else {
      const deletion = dp(i - 1, j);
      const insertion = dp(i, j - 1);
      replacement = dp(i - 1, j - 1);
      memo[`${i},${j}`] = 1 + Math.min(deletion, insertion, replacement);
    }
    return memo[`${i},${j}`];
  }

  return dp(str1.length, str2.length);
}
console.log("Is edit distance", editDistance("kitten", "sitting")); // Output: 3

// word break

function wordBreak(string, arrayOfWords) {
  // check for empty string and return true since an empty string can be broken
  // build an an of length string, with default false values
  // asign index 0 true, an empty prefix, can always be segmented
  // loop over with start index (inner) and end index (outer)
  // break inner loop whenever a word can be broken dp[start_index] && arrayOfWords.includes(string.substring(start_index, end_index))
  if (string.length === 0) {
    return true;
  }
  const n = string.length;
  const dp = new Array(n).fill(false);

  dp[0] = true;

  for (let endIndex = 1; endIndex <= n; endIndex++) {
    for (let startIndex = 0; startIndex < endIndex; startIndex++) {
      if (
        dp[startIndex] &&
        arrayOfWords.includes(string.slice(startIndex, endIndex))
      ) {
        dp[endIndex] = true;
        break;
      }
    }
  }

  return dp[n];
}

console.log("Word break javascritp", wordBreak("leetcode", ["leet", "code"]));

me2 = Array.from({ length: 6 }, () => Array(4).fill(0));
console.log("Brand new", me2);

// binary search

// top k most frequent element

function topKMostFrequentElements(array, k) {
  // build a hashmap of elements and their frequencies
  // build a bucket of size k, with default empty arrays
  // populate the bucket with element into array position as per frequency
  // iterate the bucket in reverse and return when k elements are found
  frequencyMap = new Map();

  array.forEach((element) => {
    frequencyMap.set(element, (frequencyMap.get(element) || 0) + 1);
  });

  const bucket = Array.from({ length: array.length + 1 }, () => []);
  // populate the bucket with element into array position as per frequency e.g if 3 4's then bucket[3] = [4]

  // for (const key in map) {
  //   bucket[map[key]].push(element);
  // }

  for (const [key, value] of frequencyMap) {
    bucket[value].push(key);
  }
  // array.forEach((element) => {
  //   bucket[map[element]].push(element);
  // });

  console.log("State of map", frequencyMap);
  // for (const num in map) {
  //   const frequency = map[num];
  //   bucket[frequency].push(Number(num)); // Convert key to number
  // }

  console.log("How the bucket looks", bucket);
  const result = [];
  // itereate the bucket in reverse and return when k elements are found
  for (let i = bucket.length - 1; i >= 0; i--) {
    for (const element of bucket[i]) {
      result.push(element);
      if (result.length === k) {
        console.log("Returning result:", result);
        return result;
      }
    }
  }
  return result;
}

const sampleArray = [12, 12, 34, 56, 34, 12, 47, 40, 40, 35];
console.log(
  "topKMostFrequentElements",
  topKMostFrequentElements(sampleArray, 3)
);

// binary search
function binarySearch(array, target) {
  let left = 0;
  let right = array.length - 1;
  while (left <= right) {
    let mid = Math.floor((left + right) / 2);
    if (array[mid] === target) {
      return true;
    }
    if (array[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return false;
}

console.log("Binary search " + binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9], 19));

// longest substring without repeating characters

function longestSubstringWithoutRepeatingCharacters(string) {
  // set i=0, j=0, longest=0, and longestString =""
  // use sliding window technique to find the longest substring without repeating characters
  // move j within the string and check if the character at j is in the set, if it is, move i to the next character and remove the character at i from the set
  // use set to keep track of what you have added and not. .add() and .has()
  let i = 0;
  let j = 0;
  let longest = 0;
  let longestString = "";
  const set = new Set();

  while (j < string.length) {
    // test if you can add the character at j to the set
    if (set.has(string[j])) {
      set.delete(string[i]);
      i++;
    } else {
      set.add(string[j]);
      j++;
      if (j - i > longest) {
        longest = j - i;
        longestString = string.slice(i, j);
      }
    }
  }
  return longestString;
}

s1 = "abcabcbb";
s2 = "bbbbb";
s3 = "pwwkew";
s4 = "abbac";
console.log(
  "Longest substring without repeating characters",
  longestSubstringWithoutRepeatingCharacters(s4)
);

// longest substring with k distinct characters

function longestSubstringWithKDistinctCharacters(string, k) {
  // set i=0, j=0, maxlength=0, frequencyMap and longestString =""
  // use a map to map each character to its frequency
  let i = 0;
  let j = 0;
  let maxLength = 0;
  const frequencyMap = new Map();

  while (j < string.length) {
    // build the frequency map
    const rightChar = string[j];
    frequencyMap.set(rightChar, (frequencyMap.get(rightChar) || 0) + 1);
    while (frequencyMap.size > k) {
      // remove the frequency of character at i from the map
      const leftChar = s[i];
      frequencyMap.set(leftChar, frequencyMap.get(leftChar) - 1);
      // check if frequecy of the left pointer is 0, if so remove the character at i from the map
      if (frequencyMap.get(leftChar) === 0) {
        frequencyMap.delete(leftChar);
      }
      // actually move the left pointer
      i++;
    }
    // update the max length
    maxLength = Math.max(maxLength, j - i + 1);
    j++;
  }
  return maxLength;
}

const s = "araaci";
const k = 2;
console.log(
  "longestSubstringWithKDistinctCharacters",
  longestSubstringWithKDistinctCharacters(s, k)
);

// super digit

function superDigit(n, k) {
  // convert n to string and add it to itself k times
  function sumDigits(n) {
    // split n into individual digits and add them together
    return n
      .toString()
      .split("")
      .reduce((sum, num) => sum + parseInt(num), 0);
  }

  const initialSum = sumDigits(n) * k;

  function sumDigitsRecursive(n) {
    // base case: if n is a single digit, return n
    if (n < 10) {
      return n;
    }
    // new sum by calling sumDigits on the sum of digits
    const newSum = sumDigits(n);
    return sumDigitsRecursive(newSum);
  }

  return sumDigitsRecursive(initialSum);
}
console.log("Is super digit", superDigit(148, 3));

// two sum problem
function twoSum(array, target) {
  // create a map with
  const map = new Map();
  for (let i = 0; i < array.length; i++) {
    const complement = target - array[i];
    if (map.has(complement) && map.get(complement) !== i) {
      return [map.get(complement), i];
    }
    map.set(array[i], i);
  }
}

// three sum problem

function threeSum(array, target) {
  // build a map
  const map = new Map();
  for (let i = 0; i < array.length; i++) {
    map.set(array[i], i);
  }
  result = [];
  for (let i = 0; i < array.length; i++) {
    const twoNumSum = target - array[i];
    for (let j = i + 1; j < array.length; j++) {
      // the num you a re looking for is the complement of the twoNumSum
      const num = twoNumSum - array[j];
      if (map.has(num) && map.get(num) !== j) {
        result = [i, j, map.get(num)];
      }
    }
  }
  return result;
}

// binary gap

function binaryGap(n) {
  const binaryString = n.toString(2);
  const gaps = binaryString.split("1");

  if (gaps[0] === "") {
    gaps.shift();
  }
  if (gaps[gaps.length - 1] === "") {
    gaps.pop();
  }
  let longestGap = 0;
  for (gap of gaps) {
    if (gap.length > longestGap) {
      longestGap = gap;
    }
  }
  return longestGap;
}

// analigram solution

function isAnaligram(firstString, secondString) {
  // check if the length of the strings are the same, if not return false
  if (firstString.length !== secondString.length) {
    return false;
  }
  // build a map of the first string
  const map = new Map();
  for (let i = 0; i < firstString.length; i++) {
    const char = firstString[i];
    map.set(char, (map.get(char) || 0) + 1);
  }
  // loop over the second string and decrement the map value
  for (let i = 0; i < secondString.length; i++) {
    const char = secondString[i];
    if (!map.has(char)) {
      return false;
    }
    map.set(char, map.get(char) - 1);
  }
  // check if the map has any values greater than 0, if so return false
  for (const value of map.values()) {
    if (value > 0) {
      return false;
    }
  }
  return true;
}

//
function maxSubArraySum(arr) {
  let maxSoFar = arr[0];
  let maxEndingHere = arr[0];

  for (let i = 1; i < arr.length; i++) {
    maxEndingHere = Math.max(arr[i], maxEndingHere + arr[i]);
    maxSoFar = Math.max(maxSoFar, maxEndingHere);
  }

  return maxSoFar;
}
