
        const header = document.getElementById("header");
        const menuButton = document.getElementById("menuButton");
        const navLinks = document.getElementById("navLinks");

        window.addEventListener("scroll", () => {
            if (!header) return;
            if (window.scrollY > 30) {
                header.classList.add("scrolled");
            } else {
                header.classList.remove("scrolled");
            }
        });

        if (menuButton && navLinks) {
            menuButton.addEventListener("click", () => {
                navLinks.classList.toggle("open");
            });
        }

        document.querySelectorAll(".nav-dropdown-btn").forEach(btn => {
            btn.addEventListener("click", () => {
                if (window.innerWidth <= 700) {
                    btn.closest(".nav-dropdown").classList.toggle("mobile-open");
                }
            });
        });
