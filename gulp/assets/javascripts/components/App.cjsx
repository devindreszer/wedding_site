React = require('react/addons')
Router = require('react-router')
$ = require('jquery')
classNames = require('classnames')

App = React.createClass
  getInitialState: ->
    mobileNavOpen: false
    logoInHeader: undefined

  componentDidMount: ->
    @setState logoInHeader: window.location.hash != '#/'

  handleClick: (event) ->
    href = event.target.href
    @setState
      mobileNavOpen: false
      logoInHeader: true

  handleHomeClick: ->
    @setState
      mobileNavOpen: false
      logoInHeader: false

  handleButtonClick: (event) ->
    event.preventDefault()
    @setState mobileNavOpen: !@state.mobileNavOpen

  render: ->
    mobileNavButton = @renderMobileNavButton()
    mobileNav = @renderMobileNav()
    header = @renderHeader()
    content = @renderContent()
    <div id='app'>
      {mobileNavButton}
      {mobileNav}
      {header}
      {content}
    </div>

  renderMobileNavButton: ->
    if @state.mobileNavOpen
      iClasses = 'fa fa-times fa-fw'
      aClasses='navigation-button navigation-close'
    else
      iClasses = 'fa fa-bars fa-fw'
      aClasses='navigation-button navigation-open'
    <a href='#' className={aClasses} onClick={@handleButtonClick}>
      <i className={iClasses}></i>
    </a>

  renderMobileNav: ->
    classes = classNames
      'active': @state.mobileNavOpen
    <div id='mobile-nav-container' className={classes}>
      {@renderNav()}
    </div>

  renderHeader: ->
    <header id='desktop-header'>
      {@renderNav()}
    </header>

  renderNav: ->
    Link = Router.Link
    navClasses = classNames
      'logo-in-header': @state.logoInHeader
    <nav id='main-nav' className={navClasses}>
      <div className='main-nav-left'>
        <Link className='main-nav-link' to="our-story" onClick={@handleClick}>Our Story</Link>
        <Link className='main-nav-link' to="wedding" onClick={@handleClick}>Wedding</Link>
        <Link className='main-nav-link' to="reception" onClick={@handleClick}>Reception</Link>
      </div>
      <div className='main-nav-logo-container'>
        <Link className='main-nav-logo' to="app" onClick={@handleHomeClick}></Link>
      </div>
      <div className='main-nav-right'>
        <Link className='main-nav-link main-nav-four' to="registry" onClick={@handleClick}>Registry</Link>
        <Link className='main-nav-link' to="photos" onClick={@handleClick}>Photos</Link>
        <Link className='main-nav-link' to="rsvp" onClick={@handleClick}>RSVP</Link>
      </div>
    </nav>

  renderContent: ->
    RouteHandler = Router.RouteHandler
    <div id='main'>
      <RouteHandler />
    </div>

module.exports = App

# React = require('react/addons')
# classNames = require('classnames')

# MainContent = require('./MainContent')
# MainNavigation = require('./MainNavigation')

# App = React.createClass
#   getInitialState: ->
#     activeView: 'content'
#     content: 'home'

#   componentDidMount: ->
#     @setHeight()
#     window.addEventListener('resize', @setHeight)

#   setHeight: ->
#     documentHeight = window.innerHeight
#     $app = $(@getDOMNode())
#     $app.css('height', documentHeight)

#   setContent: (content) ->
#     @setState activeView: 'content'
#     setTimeout(=>
#       @setState content: content
#     1000)

#   handleClick: (event) ->
#     event.preventDefault()
#     if @state.activeView == 'content' and @state.content == 'home'
#       @setState activeView: 'navigation'
#     else
#       @setState
#         activeView: 'content'
#         content: 'home'

#   render: ->
#     if @state.activeView == 'content' and @state.content == 'home'
#       iClasses = 'fa fa-bars fa-fw'
#       aClasses='navigation-button navigation-open'
#     else
#       iClasses = 'fa fa-times fa-fw'
#       aClasses='navigation-button navigation-close'
#     <div id='app'>
#       <a href='#' className={aClasses} onClick={@handleClick}>
#         <i className={iClasses}></i>
#       </a>
#       <MainContent
#         content={@state.content}
#         isActive={@state.activeView == 'content'} />
#       <MainNavigation
#         ref="nav"
#         setContent={@setContent}
#         isActive={@state.activeView == 'navigation'} />
#     </div>

# module.exports = App
