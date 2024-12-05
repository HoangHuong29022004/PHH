export const themeToggle = () => {
    const toggle = document.querySelector('.theme-toggle');
    if (toggle) {
        toggle.addEventListener('click', () => {
            document.body.classList.toggle('dark-mode');
            toggle.querySelector('i').classList.toggle('fa-sun');
            toggle.querySelector('i').classList.toggle('fa-moon');
        });
    }
};