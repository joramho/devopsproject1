const sum = require('../index');

function testSum() {
    if (sum(2,3) !== 5) {
        console.error('Test failed: sum(2,3) should be 5');
        process.exit(1);
    } else {
        console.log('Test passed');
    }
}

testSum();
