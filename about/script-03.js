
document.querySelectorAll(".story-tab").forEach(btn => {
    btn.addEventListener("click", () => {
        const key = btn.dataset.storyTab;

        document.querySelectorAll(".story-tab").forEach(x => x.classList.remove("active"));
        document.querySelectorAll(".storyboard-panel").forEach(x => x.classList.remove("active"));

        btn.classList.add("active");
        const panel = document.querySelector('[data-story-panel="' + key + '"]');
        if (panel) panel.classList.add("active");
    });
});

document.querySelectorAll(".compliance-trigger").forEach(btn => {
    btn.addEventListener("click", () => {
        btn.closest(".compliance-item").classList.toggle("open");
    });
});
