var flipSpeed = 1000

function incrSpeed(){
    flipSpeed += 100;
    printSpeed();
}

function decrSpeed(){
    flipSpeed -= 100;
    printSpeed();
}

function speedLimit() {
  if (flipSpeed > 10000 ) {
    flipSpeed = 9999;
  } else if (flipSpeed < 200) {
      flipSpeed = 201;
  }
}

function printSpeed(){
    document.getElementById('currentspeed').innerHTML = flipSpeed;
    speedLimit();
}