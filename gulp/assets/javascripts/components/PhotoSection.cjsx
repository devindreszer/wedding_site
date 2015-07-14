React = require('react/addons')
classNames = require('classnames')

PhotoActions = require('../actions/PhotoActions')
PhotoStore = require('../stores/PhotoStore')

PhotoSection = React.createClass
  getInitialState: ->
    photos: []
    errorMessage: undefined
    isLoading: undefined

  componentDidMount: ->
    PhotoStore.listen(@onChange)
    PhotoActions.fetchPhotos()

  componentWillUnmount: ->
    PhotoStore.unlisten(@onChange)

  onChange: ->
    @setState PhotoStore.getState()

  render: ->
    photoContent = if @state.photos.length == 0
      @renderPhotoSpinner()
    else
      @renderPhotos()
    <div id='photos-section'>
      <div className='header-section'>
        <div className='header-image photos-header'>
        </div>
      </div>
      <div className='photos-container'>
        {photoContent}
      </div>
    </div>

  renderPhotoSpinner: ->
    <i className='fa fa-spinner fa-fw fa-puls'></i>

  renderPhotos: ->
    photos = @state.photos
    <div className='main-container row'>
      <div className='large-column-40 small-column-80'>

        <div className='row'>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[0].image_url}')"}>
          </div>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[1].image_url}')"}>
          </div>
        </div>

        <div className='row'>
          <div className='photo-box large-box-27 small-box-53'
            style={backgroundImage: "url('#{photos[2].image_url}')"}>
          </div>
          <div className='large-column-13 small-column-27'>
            <div className='photo-box large-box-13 small-box-27'
              style={backgroundImage: "url('#{photos[3].image_url}')"}>
            </div>
            <div className='photo-box large-box-13 small-box-27'
              style={backgroundImage: "url('#{photos[4].image_url}')"}>
            </div>
          </div>
        </div>

        <div className='row'>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[5].image_url}')"}>
          </div>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[6].image_url}')"}>
          </div>
        </div>

        <div className='row'>
          <div className='photo-box large-box-13 small-box-27'
            style={backgroundImage: "url('#{photos[7].image_url}')"}>
          </div>
          <div className='photo-box large-box-13 small-box-27'
            style={backgroundImage: "url('#{photos[8].image_url}')"}>
          </div>
          <div className='photo-box large-box-13 small-box-27'
            style={backgroundImage: "url('#{photos[9].image_url}')"}>
          </div>
        </div>
      </div>

      <div className='large-column-40 small-column-80'>
        <div className='row'>
          <div className='photo-box large-box-13 small-box-27'
            style={backgroundImage: "url('#{photos[10].image_url}')"}>
          </div>
          <div className='photo-box large-box-13 small-box-27'
            style={backgroundImage: "url('#{photos[11].image_url}')"}>
          </div>
          <div className='photo-box large-box-13 small-box-27'
            style={backgroundImage: "url('#{photos[12].image_url}')"}>
          </div>
        </div>

        <div className='row'>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[13].image_url}')"}>
          </div>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[14].image_url}')"}>
          </div>
        </div>

        <div className='row'>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[15].image_url}')"}>
          </div>
          <div className='photo-box large-box-20 small-box-40'
            style={backgroundImage: "url('#{photos[16].image_url}')"}>
          </div>
        </div>

        <div className='row'>
          <div className='large-column-13 small-column-27'>
            <div className='photo-box large-box-13 small-box-27'
              style={backgroundImage: "url('#{photos[17].image_url}')"}>
            </div>
            <div className='photo-box large-box-13 small-box-27'
              style={backgroundImage: "url('#{photos[18].image_url}')"}>
            </div>
          </div>
          <div className='photo-box large-box-27 small-box-53'
            style={backgroundImage: "url('#{photos[19].image_url}')"}>
          </div>
        </div>
      </div>
    </div>

module.exports = PhotoSection
