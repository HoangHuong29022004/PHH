import 'bootstrap';

// Import các modules
import { themeToggle } from './modules/theme';
import { initRain } from './modules/rain';
import { customCursor } from './modules/cursor';
import { initNavigation, handleActiveLinks } from './modules/navigation';
import Skills from './modules/skills';
import Footer from './modules/footer';
import Projects from './modules/projects';

// Khởi tạo khi DOM loaded
document.addEventListener('DOMContentLoaded', () => {
    console.log('Initializing modules...'); // Debug log

    // Khởi tạo các module cơ bản
    themeToggle();
    initRain();
    customCursor();
    
    // Navigation initialization
    initNavigation(); // Đã bao gồm handleHeaderScroll
    handleActiveLinks();

    // Initialize class-based modules
    new Skills();
    new Footer();
    new Projects();

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
            const targetElement = document.querySelector(this.getAttribute('href'));
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth'
                });
            }
        });
    });
});