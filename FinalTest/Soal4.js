let segitiga = ''
for(let i = 1; i <= 7; i++) {
	for(let j = i; j <= i+i-1; j++) {
		segitiga += j + ' '
	}
	segitiga += '\n'
}
console.log(segitiga);

let segitiga1 = ''
for(let i = 5; i <= 11; i++) {
	for(let j = i; j <= i+i-5; j++) {
		segitiga1 += j + ' '
	}
	segitiga1 += '\n'
}
console.log(segitiga1);