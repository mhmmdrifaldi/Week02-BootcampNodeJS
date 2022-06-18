function totalLompat(x, y, k) {
    let hasil = 0;
    for (let i = 1; x <= y; i++) {
        x += k;
        hasil = i;
    }
    return hasil;
}
console.log(totalLompat(10, 85, 30));
