export const initNavigation = () => {
    const mobileMenu = document.querySelector('.mobile-menu');
    const nav = document.querySelector('.nav');
    const navLinks = document.querySelectorAll('.nav-link');

    if (mobileMenu && nav) {
        mobileMenu.addEventListener('click', () => {
            mobileMenu.classList.toggle('active');
            nav.classList.toggle('active');
        });

        // Close menu when clicking a link
        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                if (nav.classList.contains('active')) {
                    mobileMenu.classList.remove('active');
                    nav.classList.remove('active');
                }
            });
        });
    }
}; 