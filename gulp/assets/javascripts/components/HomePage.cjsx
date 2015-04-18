React = require('react/addons')
classNames = require('classnames')

HomePage = React.createClass
  render: ->
    <div id="home-page">
      <div className='home-page-logo'>
        Lindsey & Devin
        <br />
        Pescadero | 10.31.15
      </div>
    </div>

module.exports = HomePage
