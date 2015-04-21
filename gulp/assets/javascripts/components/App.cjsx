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
    $land = $(React.findDOMNode(@refs.land))
    $app.css('height', documentHeight)
    $land.css('height', documentHeight * (1/3))

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
      iClasses = 'fa fa-share fa-fw'
      flipClasses = 'flip-container'
    else
      iClasses = 'fa fa-reply fa-fw'
      flipClasses = 'flip-container flip'
    <div id='app'>
      <div ref='sky' className="sky">
      </div>
      <div ref='land' className='land'>
      </div>
    </div>


# <a href='#' className="navigation-button" onClick={@handleClick}>
#         <i className={iClasses}></i>
#       </a>
#       <div ref='flipContainer' className={flipClasses}>
#         <div className='flipper'>
#           <MainContent content={@state.content}/>
#           <MainNavigation setContent={@setContent} />
#         </div>
#       </div>

module.exports = App
