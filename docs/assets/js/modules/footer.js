export default class Footer {
    constructor() {
        this.socialLinks = document.querySelectorAll('.social-item');
        this.contactItems = document.querySelectorAll('.contact-item');
        this.init();
    }

    init() {
        this.addHoverEffects();
        this.addCopyToClipboard();
    }

    addHoverEffects() {
        [...this.socialLinks, ...this.contactItems].forEach(item => {
            item.addEventListener('mouseenter', () => {
                item.style.transform = 'translateY(-5px)';
            });

            item.addEventListener('mouseleave', () => {
                item.style.transform = 'translateY(0)';
            });
        });
    }

    addCopyToClipboard() {
        this.contactItems.forEach(item => {
            item.addEventListener('click', () => {
                const text = item.querySelector('span').textContent;
                navigator.clipboard.writeText(text).then(() => {
                    // Add temporary tooltip or notification
                    const notification = document.createElement('div');
                    notification.className = 'copy-notification';
                    notification.textContent = 'Copied!';
                    item.appendChild(notification);

                    setTimeout(() => {
                        notification.remove();
                    }, 2000);
                });
            });
        });
    }
} 