alt = require('../alt')

class PhotoActions
  fetchPhotos: ->
    @dispatch()
    fetch("photos.json", {
      method: 'GET'
      credentials: 'same-origin'
      headers:
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
    })
      .then (response) => response.json()
      .then (photos) => @actions.updatePhotos(photos)
      .catch (errorMessage) => @actions.photosFailed(errorMessage)

  updatePhotos: (photos) ->
    @dispatch(photos)

  photosFailed: (errorMessage) ->
    @dispatch(errorMessage)

module.exports = alt.createActions(PhotoActions)
