/*global Image*/
var counter = 0, totalheads = 0, totaltails = 0; 
var consheads = 0, constails= 0, flipResult = "", lastResult = "" ;
var headsRecord = 0, tailsRecord = 0, consAlts = 0, altRecord = 0 ;
var flipSpeed = 1000;

// images are preloaded for better performance. 
var heads_image = new Image();
heads_image.src = '/heads.jpg';
var tails_image = new Image();
tails_image.src = '/tails.jpg';



  //first declare all the functions 
  function flipCoin() {
    return (Math.floor(Math.random() * 2) == 0) ? 'heads' : 'tails';
  }

  function sumResults() {
    if (flipResult == "heads") {
      totalheads += 1;} 
    else {
      totaltails += 1;}
  }
  
  function sumConsecutives() {
    if (flipResult == lastResult && flipResult == 'heads') {
      constails = 0;
      consAlts = 0;
      consheads += 1 } 
    else if (flipResult == lastResult && flipResult == 'tails') {
      consheads = 0;
      consAlts = 0;
      constails += 1 }
    else {
      consheads = 0; 
      constails = 0;
      consAlts += 1 }
  }
  
  function consRecord() {
    if (consheads > headsRecord) {
      headsRecord = consheads } 
    else if (constails > tailsRecord) {
      tailsRecord = constails  } 
    else if (consAlts > altRecord ){
      altRecord = consAlts;
    }
  }
  
  function refreshDiv(){
    counter += 1;
    flipResult = flipCoin();
    sumResults();
    sumConsecutives();
    document.getElementById("result").innerHTML = flipResult;
    document.getElementById("myImage").src = '/' + flipResult + '.jpg';
    document.getElementById("totalFlips").innerHTML = counter;
    document.getElementById("theads").innerHTML = totalheads;
    document.getElementById("ttails").innerHTML = totaltails;
    document.getElementById("cheads").innerHTML = consheads;
    document.getElementById("ctails").innerHTML = constails;
    document.getElementById("rheads").innerHTML = headsRecord;
    document.getElementById("rtails").innerHTML = tailsRecord;
    document.getElementById("ralts").innerHTML = altRecord;
    document.getElementById("calts").innerHTML = consAlts;
    lastResult = flipResult;
    printSpeed();
    consRecord();
  }

  function speedLimit() {
    if (flipSpeed > 10000 ) {
      flipSpeed = 9999;
    } else if (flipSpeed < 10) {
        flipSpeed = 11;
    }
  }

  function incrSpeed(){
    flipSpeed += 100;
    printSpeed();
  }

  function decrSpeed(){
    flipSpeed -= 100;
    printSpeed();
  }

  function printSpeed(){
    document.getElementById('currentspeed').innerHTML = flipSpeed;
    speedLimit();
  }

  function timeoutBang() {
    setTimeout(function () {
      refreshDiv();
        timeoutBang();
    }, flipSpeed);
  }


// ***********************************************
//         ALL SHIT DECLARED!!
// ***********************************************
// start flipping coins and drawing results

timeoutBang();

