React = require('react/addons')
classNames = require('classnames')

MainContent = require('./MainContent')
MainNavigation = require('./MainNavigation')

App = React.createClass
  getInitialState: ->
    activeView: 'content'
    content: 'home'

  componentDidMount: ->
    @setHeight()
    window.addEventListener('resize', @setHeight)

  setHeight: ->
    documentHeight = window.innerHeight
    $app = $(@getDOMNode())
    $app.css('height', documentHeight)

  setContent: (content) ->
    @setState activeView: 'content'
    setTimeout(=>
      @setState content: content
    1000)

  handleClick: (event) ->
    event.preventDefault()
    if @state.activeView == 'content' and @state.content == 'home'
      @setState activeView: 'navigation'
    else
      @setState
        activeView: 'content'
        content: 'home'

  render: ->
    if @state.activeView == 'content' and @state.content == 'home'
      iClasses = 'fa fa-bars fa-fw'
      aClasses='navigation-button navigation-open'
    else
      iClasses = 'fa fa-times fa-fw'
      aClasses='navigation-button navigation-close'
    <div id='app'>
      <a href='#' className={aClasses} onClick={@handleClick}>
        <i className={iClasses}></i>
      </a>
      <MainContent
        content={@state.content}
        isActive={@state.activeView == 'content'} />
      <MainNavigation
        ref="nav"
        setContent={@setContent}
        isActive={@state.activeView == 'navigation'} />
    </div>

module.exports = App
