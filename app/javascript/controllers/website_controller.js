import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["card", "form", "question"];

  revealform(e) {
    const card = e.currentTarget;
    const planName = card.querySelector("h2").innerText.trim().toLowerCase();

    // make selercted card big
    this.cardTargets.forEach(c => {
      c.classList.toggle("is-active", c === card);
    });

    // make the right one visible
    this.formTargets.forEach(form => {
      if (form.classList.contains(planName)) {
        form.classList.remove("hidden-site");
        //cccrrazy method
        form.scrollIntoView({ behavior: "smooth" });
      } else {
        form.classList.add("hidden-site");
      }
    });
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
