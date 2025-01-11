export default class Projects {
    constructor() {
        this.projectItems = document.querySelectorAll('.project-item');
        this.init();
    }

    init() {
        this.addHoverEffects();
    }

    addHoverEffects() {
        this.projectItems.forEach(item => {
            item.addEventListener('mouseenter', () => {
                item.style.transform = 'translateY(-5px)';
                item.style.boxShadow = '0 15px 30px rgba(0, 0, 0, 0.15)';
            });

            item.addEventListener('mouseleave', () => {
                item.style.transform = 'translateY(0)';
                item.style.boxShadow = '0 10px 25px rgba(0, 0, 0, 0.1)';
            });
        });
    }
} 