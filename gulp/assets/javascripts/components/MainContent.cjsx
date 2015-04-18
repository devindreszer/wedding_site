React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

HomePage = require('./HomePage')
LodgingPage = require('./LodgingPage')

MainContent = React.createClass
  render: ->
    switch @props.content
      when 'home' then page = @renderHomePage()
      when 'lodging' then page = @renderLodgingPage()
    <div id="main-content">
      {page}
    </div>

  renderHomePage: ->
    <HomePage />

  renderLodgingPage: ->
    <LodgingPage />

module.exports = MainContent
