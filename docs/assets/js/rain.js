document.addEventListener('DOMContentLoaded', function() {
    const rain = document.querySelector('.rain');
    const numberOfDrops = 50;
    
    function createRainDrop() {
        const drop = document.createElement('div');
        drop.className = 'drop';
        drop.style.left = Math.random() * 100 + '%';
        drop.style.animationDuration = Math.random() * 1 + 0.5 + 's';
        drop.style.opacity = Math.random();
        rain.appendChild(drop);

        drop.addEventListener('animationend', () => {
            drop.remove();
        });
    }

    // Tạo các giọt mưa ban đầu
    for(let i = 0; i < numberOfDrops; i++) {
        setTimeout(createRainDrop, Math.random() * 2000);
    }

    // Tiếp tục tạo giọt mưa mới
    setInterval(createRainDrop, 100);
});