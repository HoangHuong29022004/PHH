import 'bootstrap';

// Import các modules
import { themeToggle } from './modules/theme';
import { initRain } from './modules/rain';
import { customCursor } from './modules/cursor';

// Khởi tạo khi DOM loaded
document.addEventListener('DOMContentLoaded', () => {
    // Khởi tạo các module
    themeToggle();
    initRain();
    customCursor();

    // Khởi tạo AOS
    if (window.AOS) {
        window.AOS.init({
            duration: 1000,
            once: true
        });
    }

    // Smooth Scrolling
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});