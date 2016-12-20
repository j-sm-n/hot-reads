$(document).ready(function () {
  addReads()
})

function addReads () {
  $.getJSON('/api/v1/reads')
  .then(function (allReads) {
    allReads.forEach(renderRead)
  })
  .fail(displayFailure)
}
