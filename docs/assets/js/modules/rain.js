export const initRain = () => {
    console.log('Rain effect initializing...'); // Debug log
    const rainContainer = document.querySelector('.rain');
    if (!rainContainer) {
        console.warn('Rain container not found');
        return;
    }

    const particleCount = 200;

    for (let i = 0; i < particleCount; i++) {
        createRainDrop(rainContainer);
    }
};

function createRainDrop(container) {
    const drop = document.createElement('div');
    drop.className = 'rain-drop';

    const startPositionX = Math.random() * 100;
    const fallDuration = Math.random() * 1.5 + 1;
    const delay = Math.random() * 3;
    const size = Math.random() * 2 + 1;

    drop.style.cssText = `
        left: ${startPositionX}%;
        width: ${size}px;
        height: ${size * 15}px;
        animation: fall ${fallDuration}s linear ${delay}s infinite;
        opacity: ${Math.random() * 0.4 + 0.1};
    `;

    container.appendChild(drop);
}