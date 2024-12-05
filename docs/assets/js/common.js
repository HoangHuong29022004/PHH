import 'bootstrap';

// Import các modules
import { themeToggle } from './modules/theme';
import { initRain } from './modules/rain';
import { customCursor } from './modules/cursor';
import { initNavigation } from './modules/navigation';
import { handleHeaderScroll, handleActiveLinks, toggleMobileMenu } from './modules/header';
import Skills from './modules/skills'; // Correct import for Skills module
import Footer from './modules/footer';
import Projects from './modules/projects';

// Khởi tạo khi DOM loaded
document.addEventListener('DOMContentLoaded', () => {
    // Khởi tạo các module
    themeToggle();
    initRain();
    customCursor();
    initNavigation();
    handleHeaderScroll();
    handleActiveLinks();

    // Initialize Skills module
    new Skills();

    // footer
    new Footer();

    new Projects();

    // Mobile menu toggle listener
    document.querySelector('.mobile-menu')?.addEventListener('click', toggleMobileMenu);

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