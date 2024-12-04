document.addEventListener('DOMContentLoaded', function() {
    const rain = document.querySelector('.rain');
    const numberOfDrops = 100;
    
    function createRainDrop() {
        const drop = document.createElement('div');
        drop.classList.add('raindrop');
        
        // Random positioning and timing
        drop.style.left = Math.random() * 100 + 'vw';
        drop.style.animationDuration = (Math.random() * 1 + 0.5) + 's';
        drop.style.animationDelay = Math.random() * 2 + 's';
        
        rain.appendChild(drop);
    }

    // Tạo các giọt mưa ban đầu
    for(let i = 0; i < numberOfDrops; i++) {
        setTimeout(createRainDrop, Math.random() * 2000);
    }

    // Tiếp tục tạo giọt mưa mới
    setInterval(createRainDrop, 100);
});