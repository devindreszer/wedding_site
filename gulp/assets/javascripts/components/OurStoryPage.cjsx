React = require('react/addons')
classNames = require('classnames')

OurStoryPage = React.createClass
  render: ->
    <div id="our-story-page" className='sub-content-page'>
      <h3 className='content-page-header'>
        Our Story
      </h3>
      <div ref='sky' className="sky">
        <div className='map'>
        </div>
      </div>
    </div>

module.exports = OurStoryPage
