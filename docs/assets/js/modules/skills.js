    export default class Skills {
    constructor() {
        this.progressBars = document.querySelectorAll('.progress-bar');
        this.skillItems = document.querySelectorAll('.skill-item');
        this.init();
    }

    init() {
        this.setProgressBars();
        this.addScrollAnimation();
        this.addHoverEffects();
    }

    setProgressBars() {
        this.progressBars.forEach(bar => {
            const progress = bar.dataset.progress;
            bar.style.setProperty('--progress', `${progress}%`);
        });
    }

    addScrollAnimation() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-progress');
                    observer.unobserve(entry.target);
                }
            });
        }, {
            threshold: 0.2
        });

        this.skillItems.forEach(item => observer.observe(item));
    }

    addHoverEffects() {
        this.skillItems.forEach(item => {
            item.addEventListener('mouseenter', () => {
                const bar = item.querySelector('.progress-bar');
                bar.classList.add('active');
            });

            item.addEventListener('mouseleave', () => {
                const bar = item.querySelector('.progress-bar');
                bar.classList.remove('active');
            });
        });
    }
} 