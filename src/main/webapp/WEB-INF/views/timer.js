const timer = document.querySelector('.js-timer'),
  stopBtn = document.querySelector('.js-timer__stopBtn'),
  startBtn = document.querySelector('.js-timer__startBtn')


let TIME = 0;
let cron; // clearInterval을 위한 변수

function startButton() {
  updateTimer();
  stopButton();
  cron = setInterval(updateTimer, 1000);
  timer.classList.add('hide');
}

function stopButton() {
  clearInterval(cron);
  timer.classList.remove('hide');
}

function updateTimer(){
    const hours = Math.floor(TIME/3600);
    const checkMinutes = Math.floor(TIME/60); 
    const seconds = TIME % 60;
    const minutes = checkMinutes % 60;
    
    timer.innerText = `${hours < 10 ? `0${hours}` : hours}:${
        minutes < 10 ? `0${minutes}` : minutes}:${
        seconds < 10 ? `0${seconds}` : seconds}`;
    TIME++;
}
startBtn.addEventListener('click', startButton);
stopBtn.addEventListener('click', stopButton);