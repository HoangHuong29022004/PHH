export const initNavigation = () => {
    console.log('Initializing navigation...');

    const navbarToggler = document.querySelector('.navbar-toggler');
    const navbarCollapse = document.querySelector('.navbar-collapse');
    const navLinks = document.querySelectorAll('.nav-link');
    let isMenuOpen = false;

    if (!navbarToggler || !navbarCollapse) {
        console.warn('Navbar toggler or collapse not found');
        return;
    }

    // Toggle menu
    const toggleMenu = (force = null) => {
        isMenuOpen = force !== null ? force : !isMenuOpen;
        console.log(`Menu is now ${isMenuOpen ? 'open' : 'closed'}`);
        navbarToggler.classList.toggle('collapsed', !isMenuOpen);
        navbarCollapse.classList.toggle('show', isMenuOpen);
        document.body.classList.toggle('menu-open', isMenuOpen);
    };

    // Click outside to close
    document.addEventListener('click', (e) => {
        if (isMenuOpen &&
            !navbarCollapse.contains(e.target) &&
            !navbarToggler.contains(e.target)) {
            toggleMenu(false);
        }
    });

    // Toggle button click
    navbarToggler.addEventListener('click', (e) => {
        e.stopPropagation();
        toggleMenu();
    });

    // Close on nav link click
    navLinks.forEach(link => {
        link.addEventListener('click', () => {
            if (isMenuOpen) {
                toggleMenu(false);
            }
        });
    });

    // Close on escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && isMenuOpen) {
            toggleMenu(false);
        }
    });

    // Prevent menu interaction from bubbling
    navbarCollapse.addEventListener('click', (e) => {
        e.stopPropagation();
    });

    // Handle scroll effects for header
    const header = document.querySelector('.header');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header?.classList.add('scrolled');
        } else {
            header?.classList.remove('scrolled');
        }
    });
};

// Handle active navigation links
export const handleActiveLinks = () => {
    const navLinks = document.querySelectorAll('.nav-link');
    const sections = document.querySelectorAll('section');

    window.addEventListener('scroll', () => {
        let current = '';
        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.clientHeight;
            if (window.scrollY >= sectionTop - 60 &&
                window.scrollY < sectionTop + sectionHeight - 60) {
                current = section.getAttribute('id');
            }
        });

        navLinks.forEach(link => {
            link.classList.remove('active');
            const href = link.getAttribute('href');
            if (href && href.includes(current)) {
                link.classList.add('active');
            }
        });
    });
}; 