React = require('react/addons')
classNames = require('classnames')

LodgingPage = React.createClass
  render: ->
    <div id="lodging-page">
      <div className='lodging-page-text'>
        <h3 className='lodging-page-header'>
          Costanoa Lodge
        </h3>
        Devin and Lindsey are staying at the Costanoa Lodge in Pescadero.
         It would be fun if we could all stay there!
         We do not have a block of rooms booked, so please reserve ASAP.
      </div>
    </div>

module.exports = LodgingPage
