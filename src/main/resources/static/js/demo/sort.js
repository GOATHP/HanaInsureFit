var restaurantArrayDesc;
var restaurantArrayAsc;
function mergeSort(arr) {
    if (arr.length <= 1) {
        return arr;
    }
    const middle = Math.floor(arr.length / 2);
    const left = arr.slice(0, middle);
    console.log("왼쪾" + left);
    const right = arr.slice(middle);

    return merge(mergeSort(left), mergeSort(right));
}
function merge(left, right) {
    let result = [];
    let leftIndex = 0;
    let rightIndex = 0;

    while (leftIndex < left.length && rightIndex < right.length) {
        if (left[leftIndex].calories > right[rightIndex].calories) {
            result.push(left[leftIndex]);
            leftIndex++;
        } else {
            result.push(right[rightIndex]);
            rightIndex++;
            console.log(result);
        }
    }
    return result.concat(left.slice(leftIndex), right.slice(rightIndex));
}
restaurantArrayDesc = mergeSort(restaurantArray).reverse();
restaurantArrayAsc = mergeSort(restaurantArray);