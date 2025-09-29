import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { class: String };

  connect() {
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          const visibleClass = this.classValue || "is-visible";
          entry.target.classList.add(...visibleClass.split(" "));
          observer.unobserve(entry.target);
        }
      })
    }, { threshold: 0.2 });

    observer.observe(this.element);
  }
}
