function displayTypedContent() {
  var options = {
    strings: [" Software Engineer always looking to learn something new such as Rails, Swift, Kotlin, and other technologies. Anyone want to play some Fortnite?"],
    typeSpeed: 30
  }

  var typed = new Typed(".typed-element", options);
}

$(document).ready(displayTypedContent);
$(document).on('turbolinks:load', displayTypedContent);
