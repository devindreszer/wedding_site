React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

HomePage = require('./HomePage')
AccomodationsPage = require('./AccomodationsPage')

MainContent = React.createClass
  render: ->
    switch @props.content
      when 'home' then page = @renderHomePage()
      when 'accomodations' then page = @renderAccomodationsPage()
    classes = classNames
      'active': @props.isActive
    <div id="main-content" className={classes}>
      {page}
    </div>

  renderHomePage: ->
    <HomePage />

  renderAccomodationsPage: ->
    <AccomodationsPage />

module.exports = MainContent
