document.addEventListener('DOMContentLoaded', function() {
  const rain = document.createElement('div');
  rain.className = 'rain';
  document.body.appendChild(rain);

  function createRainDrop() {
    const drop = document.createElement('div');
    drop.className = 'drop';
    drop.style.left = Math.random() * 100 + '%';
    drop.style.animationDuration = Math.random() * 1 + 0.5 + 's';
    rain.appendChild(drop);

    drop.addEventListener('animationend', () => {
      drop.remove();
    });
  }

  setInterval(createRainDrop, 100);
});