function sameDifferent(arr1, arr2) {
	const array = [...arr1, ...arr2];
	const arr = [...new Set(array)]
	const hasilsame = same(arr1, arr2)
	// const different = arr.filter(a => !hasilsame.includes(a))
	// const same = arr2.filter(a => arr1.includes(a))

	for(let i = 0; i < hasilsame.length; i++) {
		const index = arr.indexOf(hasilsame[i])
		arr.splice(index,1)
	}
	return `Same = [${hasilsame}]` + '\n' +
				 `Different = [${arr}]`
}

function same(arr1, arr2) {
	const same = []

	for(let i = 0; i < arr2.length; i++) {
		for(let j = i; j < arr1.length; j++) {
			if(arr2[i] == arr1[j]) {
				same.push(arr2[i])
			}
		}
	}
	return same
}

const array1 = ["Mangga", "Apel", "Melon", "Pisang", "Sirsak", "Tomat", "Nanas", "Nangka", "Timun", "Mangga"];
const array2 = ["Bayam", "Wortel", "Kangkung", "Mangga", "Tomat", "Kembang Kol", "Nangka", "Timun"];
console.log(sameDifferent(array1, array2));