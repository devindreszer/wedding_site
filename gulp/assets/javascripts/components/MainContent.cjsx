React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

HomePage = require('./HomePage')
OurStoryPage = require('./OurStoryPage')
WeddingPage = require('./WeddingPage')
ReceptionPage = require('./ReceptionPage')
RegistryPage = require('./RegistryPage')
PhotosPage = require('./PhotosPage')

MainContent = React.createClass
  render: ->
    page = switch @props.content
      when 'ourStory' then @renderOurStoryPage()
      when 'wedding' then @renderWeddingPage()
      when 'reception' then @renderReceptionPage()
      when 'registry' then @renderRegistryPage()
      when 'photos' then @renderPhotosPage()
    classes = classNames
      'active': @props.isActive
    <div id="main-content" className={classes}>
      <HomePage subContentActive={@props.content != 'home'} />
      {page}
    </div>

  renderOurStoryPage: ->
    <OurStoryPage />

  renderWeddingPage: ->
    <WeddingPage />

  renderReceptionPage: ->
    <ReceptionPage />

  renderRegistryPage: ->
    <RegistryPage />

  renderPhotosPage: ->
    <PhotosPage />

module.exports = MainContent
