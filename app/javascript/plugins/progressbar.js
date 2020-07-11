const ProgressBar = require('progressbar.js');



// line.animate(1);  // Value from 0.0 to 1.0

const initProgressbarpro = () => {
  let protein = document.getElementById("protein-bar")

  let line = new ProgressBar.Line(protein, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#fa1200',
    trailColor: '#eee',
    trailWidth: 4,
    svgStyle: {width: '80%', height: '80%'}
  });

  line.animate(protein.dataset.macro);  // Number from 0.0 to 1.0
}


const initProgressbarfat = () => {
  let fat = document.getElementById("fat-bar")

  let line = new ProgressBar.Line(fat, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#faf000',
    trailColor: '#eee',
    trailWidth: 4,
    svgStyle: {width: '80%', height: '80%'}
  });

  line.animate(fat.dataset.macro);  // Number from 0.0 to 1.0
}

const initProgressbarcarb = () => {
  let carb = document.getElementById("carb-bar")

  let line = new ProgressBar.Line(carb, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#00dcfa',
    trailColor: '#eee',
    trailWidth: 4,
    svgStyle: {width: '80%', height: '80%'}
  });

  line.animate(carb.dataset.macro);  // Number from 0.0 to 1.0
}


const initProgressbarcalorie = () => {
  let calorie = document.getElementById("carb-cal")

  let circle = new ProgressBar.Circle(calorie, {
    strokeWidth: 4,
    easing: 'easeInOut',
    duration: 1400,
    color: '#00dcfa',
    trailColor: '#eee',
    trailWidth: 4,
    svgStyle: {width: '40%', height: '40%'},



  });


  circle.animate(calorie.dataset.macro);  // Number from 0.0 to 1.0
}

// export default initProgressbarpro;
// export default initProgressbarfat;
// export default initProgressbarcarb;

export { initProgressbarpro, initProgressbarfat, initProgressbarcarb, initProgressbarcalorie };
