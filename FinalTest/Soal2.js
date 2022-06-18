function rotateArray(array, k) {
	let hasil = ''

	for(let i = 1; i <= k; i++) {
		hasil += `[${array}] => `
		array.unshift(array.pop())
		hasil += `[${array}] \n`
	}
	return hasil
}

const arr = [3, 8, 9, 7, 6]
console.log(rotateArray(arr,3));