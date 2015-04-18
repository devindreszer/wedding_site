React = require('react/addons')
classNames = require('classnames')

MainContent = require('./MainContent')
MainNavigation = require('./MainNavigation')

App = React.createClass
  getInitialState: ->
    activeSide: 'content'
    content: 'home'

  componentDidMount: ->
    @setHeight()
    window.addEventListener('resize', @setHeight)

  setHeight: ->
    documentHeight = window.innerHeight
    $app = $(@getDOMNode())
    $flipContainer = $(React.findDOMNode(@refs.flipContainer))
    $app.css('height', documentHeight)
    postCardHeight = 0.75 * documentHeight
    postCardWidth = (4/3) * postCardHeight
    $flipContainer.css
      'max-height': postCardHeight
      'max-width': postCardWidth

  setContent: (content) ->
    @setState
      activeSide: 'content'
      content: content

  handleClick: (event) ->
    event.preventDefault()
    if @state.activeSide == 'content'
      @setState activeSide: 'navigation'
    else
      @setState activeSide: 'content'

  render: ->
    if @state.activeSide == 'content'
      iClasses = 'fa fa-bars fa-fw'
      flipClasses = 'flip-container'
    else
      iClasses = 'fa fa-times fa-fw'
      flipClasses = 'flip-container flip'
    <div id='app'>
      <a href='#' className="navigation-button" onClick={@handleClick}>
        <i className={iClasses}></i>
      </a>
      <div ref='flipContainer' className={flipClasses}>
        <div className='flipper'>
          <MainContent content={@state.content}/>
          <MainNavigation setContent={@setContent} />
        </div>
      </div>
    </div>

module.exports = App
