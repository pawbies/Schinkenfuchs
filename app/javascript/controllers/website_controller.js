import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "form", "question"];

  connect() {
    const params = new URLSearchParams(window.location.search);
    const plan = params.get("plan");
    if (plan) {
      requestAnimationFrame(() => this.showPlan(plan));
    }

    this.element.addEventListener("keydown", (e) => {
      if (e.key === "Enter") {
        const target = e.target;

        e.preventDefault();
        e.stopPropagation();

        target.blur();

        this.advance({ target });
      }
    });

    if (this.element.querySelector(".field_with_errors")) {
      this.formTarget.classList.remove("hidden-site");
    }
  }

  showPlan(planName) {
    const card = this.cardTargets.find(
      c => c.querySelector("h2").innerText.trim().toLowerCase() === planName
    );
    if (!card) return;

    const radio = document.querySelector(`input[type="radio"][name="website_request[plan]"][value="${planName}"]`);
    if (radio) radio.checked = true;

    this.cardTargets.forEach(c => {
      c.classList.toggle("is-active", c === card);
    });

    this.formTarget.classList.remove("hidden-site");
    this.formTarget.scrollIntoView({ behavior: "smooth" });

  }

  revealform(e) {
    const card = e.currentTarget;
    const planName = card.querySelector("h2").innerText.trim().toLowerCase();

    // make selercted card big
    this.cardTargets.forEach(c => {
      c.classList.toggle("is-active", c === card);
    });

    // make the right one visible
    this.formTarget.classList.remove("hidden-site");
    this.formTarget.scrollIntoView({ behavior: "smooth" });

  }

  advance(e) {
    const input = e.target;
    const question = input.closest("[data-website-target='question']");
    if (!question) return;

    const parentForm = question.closest(".website-form");
    const questions = Array.from(parentForm.querySelectorAll("[data-website-target='question']"));
    const idx = questions.indexOf(question);
    if (idx === -1) return;

    const next = questions[idx + 1];
    if (next) {
      next.scrollIntoView({ behavior: "smooth", block: "center" });
      const focusable = next.querySelector("input, textarea, select, button");
      if (focusable) focusable.focus({ preventScroll: true });
    }
  }
}
