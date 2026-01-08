/* 
  Personal Website - Local Web Developer (Mumbai)
  Interactivity & Animations
*/

document.addEventListener('DOMContentLoaded', () => {

    // --- Scroll Reveal Animation ---
    const revealElements = document.querySelectorAll('.reveal');

    const revealOnScroll = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('active');
                observer.unobserve(entry.target); // Reveal only once
            }
        });
    }, {
        threshold: 0.15 // Trigger when 15% of element is visible
    });

    revealElements.forEach(el => revealOnScroll.observe(el));


    // --- Smooth Scrolling for Navigation ---
    const navLinks = document.querySelectorAll('.nav-links a, .logo');

    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            const targetId = link.getAttribute('href');
            if (targetId && targetId.startsWith('#')) {
                e.preventDefault();
                const targetElement = document.querySelector(targetId);
                if (targetElement) {
                    window.scrollTo({
                        top: targetElement.offsetTop - 80, // Offset for sticky header
                        behavior: 'smooth'
                    });
                }
            }
        });
    });


    // --- Mobile Menu Toggle ---
    const menuToggle = document.getElementById('menuToggle');
    const navLinksList = document.getElementById('navLinks');
    const navLinksAnchors = document.querySelectorAll('.nav-links a');

    if (menuToggle && navLinksList) {
        menuToggle.addEventListener('click', () => {
            navLinksList.classList.toggle('active');

            // Hamburger animation
            const spans = menuToggle.querySelectorAll('span');
            spans[0].style.transform = navLinksList.classList.contains('active') ? 'rotate(45deg) translate(5px, 5px)' : 'none';
            spans[1].style.opacity = navLinksList.classList.contains('active') ? '0' : '1';
            spans[2].style.transform = navLinksList.classList.contains('active') ? 'rotate(-45deg) translate(7px, -7px)' : 'none';
        });

        // Close menu when a link is clicked
        navLinksAnchors.forEach(link => {
            link.addEventListener('click', () => {
                navLinksList.classList.remove('active');
                // Reset hamburger
                const spans = menuToggle.querySelectorAll('span');
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            });
        });
    }


    // --- Mobile-First Adjustments ---
    // Handle sticky buttons visibility if needed
    const handleStickyButtons = () => {
        const stickyCall = document.querySelector('.sticky-call');
        // We already show both sticky buttons on mobile via CSS or they are just always there.
        // If we want to hide sticky-call on desktop, we do it here.
        if (window.innerWidth <= 768) {
            if (stickyCall) stickyCall.style.display = 'flex';
        } else {
            if (stickyCall) stickyCall.style.display = 'none';
        }
    };

    window.addEventListener('resize', handleStickyButtons);
    handleStickyButtons(); // Inital check


    // --- Log for verification ---
    console.log('Website initialized successfully. Local Web Developer - Kandivali, Mumbai.');
});
