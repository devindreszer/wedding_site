React = require('react/addons')
classNames = require('classnames')

HomePage = React.createClass
  render: ->
    classes = classNames
      'sub-content-active': @props.subContentActive
    <div id="home-page" className={classes}>
      <div ref='sky' className="sky">
        <div className='logo large'>
        </div>
      </div>
    </div>

module.exports = HomePage
