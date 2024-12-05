export const initRain = () => {
    const createRaindrop = () => {
        const raindrop = document.createElement('div');
        raindrop.className = 'raindrop';
        raindrop.style.left = Math.random() * 100 + 'vw';
        raindrop.style.animationDuration = Math.random() * 1 + 0.5 + 's';
        return raindrop;
    };

    const rain = document.querySelector('.rain');
    if (rain) {
        setInterval(() => {
            const raindrop = createRaindrop();
            rain.appendChild(raindrop);
            setTimeout(() => {
                raindrop.remove();
            }, 2000);
        }, 100);
    }
};