alt = require('../alt')
PhotoActions = require('../actions/PhotoActions')

class PhotoStore
  constructor: ->
    @state =
      photos: []
      errorMessage: null
      isLoading: false
    @bindListeners
      handleFetchPhotos: PhotoActions.FETCH_PHOTOS
      handleUpdatePhotos: PhotoActions.UPDATE_PHOTOS
      handlePhotosFailed: PhotoActions.PHOTOS_FAILED

  handleFetchPhotos: ->
    @setState
      errorMessage: null
      isLoading: true

  handleUpdatePhotos: (photos) ->
    @setState
      photos: photos
      isLoading: false

  handlePhotosFailed: (errorMessage) ->
    @setState
      errorMessage: errorMessage
      isLoading: false

module.exports = alt.createStore(PhotoStore, 'PhotoStore')
