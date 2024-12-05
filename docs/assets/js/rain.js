document.addEventListener('DOMContentLoaded', function() {
    const rain = document.querySelector('.rain');
    if (!rain) {
        console.error('Rain container not found!');
        return;
    }

    const numberOfDrops = 100;
    const colors = ['#6C63FF', '#4A45B1', '#FF6B6B'];
    
    function createRainDrop() {
        const drop = document.createElement('div');
        drop.className = 'raindrop';
        
        const size = Math.random() * 1.5 + 0.5;
        const posX = Math.random() * 100;
        const delay = Math.random() * 4;
        const duration = Math.random() * 2 + 2;
        const color = colors[Math.floor(Math.random() * colors.length)];
        
        drop.style.cssText = `
            left: ${posX}vw;
            width: ${size}px;
            height: ${size * 20}px;
            animation-delay: -${delay}s;
            animation-duration: ${duration}s;
            background: linear-gradient(
                transparent,
                ${color}80,
                transparent
            );
            opacity: 0.8;
        `;
        
        rain.appendChild(drop);
        
        drop.addEventListener('animationend', () => {
            drop.remove();
        });
    }
    
    // Initial drops
    for(let i = 0; i < numberOfDrops; i++) {
        setTimeout(createRainDrop, Math.random() * 5000);
    }
    
    // Continuous rain
    setInterval(createRainDrop, 100);

    console.log('Rain effect initialized');
});