// app.js
function sayHello() {
  return 'Hello World';
}

if (require.main === module) {
  console.log(sayHello());
}

module.exports = sayHello;
