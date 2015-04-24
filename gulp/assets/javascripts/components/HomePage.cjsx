React = require('react/addons')
classNames = require('classnames')

HomePage = React.createClass
  render: ->
    <div id="home-page">
      <div ref='sky' className="sky">
        <div className='logo large'>
        </div>
      </div>
    </div>

module.exports = HomePage
